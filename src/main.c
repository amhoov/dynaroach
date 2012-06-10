/*********************************************************************************************************
* Name: main.c
* Desc: This is a program for controlling the dynaRoACH robot. Motor commands
* for the primary power motor as well as the SMA leg actuators can be issued
* from a laptop and handled here. Sensory data is written to flash memory for 
* dumping over the wireless link after a run. 
*
* The architecture is based on a function pointer queue scheduling model. The
* meat of the control logic resides in test.c. If the radio has received a 
* command packet during the previous timer interval for Timer2, the appropriate
* function pointer is added to a queue in the interrupt service routine for 
* Timer2 (interrupts.c). The main loop simply pops the function pointer off
* the top of the queue and executes it. 
*
* Date: 2011-04-13
* Author: AMH
*********************************************************************************************************/
#include "p33Fxxxx.h"
//#include "init.h"
#include "init_default.h"
//#include "uart.h"
#include "timer.h"
#include "adc.h"
#include "i2c.h"
//#include "interrupts.h"
//#include "ports.h"
//#include "ovcam.h"
//#include "fpqueue.h"
#include "consts.h"
#include "utils.h"
//#include "payload_queue.h"
//#include "payload.h"
//#include "at86rf.h"
//#include "radio.h"
//#include "radio_dma.h"
#include "radio.h"
//#include "tests.h"
#include "gyro.h"
#include "xl.h"
#include "dfmem.h"
#include "cmd.h"
#include "motor_ctrl.h"
#include "attitude_q.h"
#include "sma.h"
#include "network.h"
//#include "stopwatch.h"
#include "sclock.h"
#include "ppool.h"
#include "cmd.h"


void initDma0(void)
{
    DMA0CONbits.AMODE = 0;                      //Configure DMA for register indirect with post increment
    DMA0CONbits.MODE = 0;                       //Configure DMA for continuous mode (not Ping Pong)
    DMA0PAD = (int)&ADC1BUF0;                   //Peripheral address register: the ADC1 buffer
    DMA0CNT = 0;                                //Transfer after ever 2 samples 
    DMA0REQ = 13;                               //Select ADC1 as DMA request source
    DMA0STA = __builtin_dmaoffset(ADCBuffer);   //DMA RAM start address

    IFS0bits.DMA0IF = 0;                        //Clear DMA interrupt flag bit
    IEC0bits.DMA0IE = 1;                        //Enable DMA interrupt
    DMA0CONbits.CHEN = 1;                       //Enable DMA channel
}

static void timer1Setup(void);

static void timer1Setup(void)
{
    unsigned int conf_reg, period;

    conf_reg = T1_ON & T1_SOURCE_INT & T1_PS_1_1 & T1_GATE_OFF & T1_SYNC_EXT_OFF;
//    period = 0x9C40; //timer period 1ms = period/FCY
    period = 0x27100; //timer period 4ms = period/FCY

    OpenTimer1(conf_reg, period);
    ConfigIntTimer1(T1_INT_PRIOR_4 & T1_INT_OFF);
}

int main ( void )
{
    /* Initialization */
    SetupClock();
    SwitchClocks();
    SetupPorts();

    spicSetup();
    ppoolInit();

    //BEGIN RADIO SETUP
    radioInit(50, 10); // tx_queue length: 50, rx_queue length: 10
//    radioSetup(50, 10); // tx_queue length: 50, rx_queue length: 10
    radioSetSrcAddr(NETWORK_SRC_ADDR);
//    radioSetDestPanID(NETWORK_BASESTATION_PAN_ID);
    radioSetSrcPanID(NETWORK_BASESTATION_PAN_ID);
    radioSetChannel(NETWORK_BASESTATION_CHANNEL);
    //END RADIO SETUP

    //BEGIN I2C SETUP
    unsigned int I2C1CONvalue, I2C1BRGvalue;
    I2C1CONvalue = I2C1_ON & I2C1_IDLE_CON & I2C1_CLK_HLD &
                   I2C1_IPMI_DIS & I2C1_7BIT_ADD & I2C1_SLW_DIS &
                   I2C1_SM_DIS & I2C1_GCALL_DIS & I2C1_STR_DIS &
                   I2C1_NACK & I2C1_ACK_DIS & I2C1_RCV_DIS &
                   I2C1_STOP_DIS & I2C1_RESTART_DIS & I2C1_START_DIS;
    I2C1BRGvalue = 363; // Fcy(1/Fscl - 1/1111111)-1
    OpenI2C1(I2C1CONvalue, I2C1BRGvalue);
    IdleI2C1();
    //END I2C SETUP


    //BEGIN ADC SETUP
    AD1CON1bits.FORM = 0b00;    //integer (0000 00dd dddd dddd) format output
    AD1CON1bits.ADON = 0;       //disable
    AD1CON1bits.SSRC = 0b011;   //Sample clock source based on PWM
    AD1CON1bits.ASAM = 0;       //Auto sampling off
    AD1CON1bits.SIMSAM = 0;     //Do not sample channels simultaneously 
    AD1CON1bits.ADSIDL = 0;     //continue in idle mode
    AD1CON1bits.AD12B = 0;      //10 bit mode

    //AD1CON2bits.BUFM = 0;       //
    AD1CON2bits.VCFG = 0b000;   //Vdd is pos. ref and Vss is neg. ref.
    AD1CON2bits.CSCNA = 0;      //Do not scan inputs
    AD1CON2bits.CHPS = 0b00;    //Convert channels 0 and 1
    AD1CON2bits.SMPI = 0b0000;  //Interrupt after 2 conversions (depends on CHPS and SIMSAM)

    AD1CON3bits.ADRC = 0;       //Derive conversion clock from system clock
    AD1CON3bits.ADCS = 0b00000010; // Each TAD is 3 Tcy
    //AD1CON1bits.ADDMABM = 1;

    //AD1CON4bits.DMABL = 1;

    AD1PCFGL = 0xFFF0;          //Enable AN0 - AN3 as analog inputs
    //AD1PCFGL = 0xFFFE;

    AD1CHS0bits.CH0SA = 0b00000;      //Select AN0 for CH0 +ve input
    AD1CHS0bits.CH0NA = 0b00000;      //Select Vref- for CH0 -ve input
    //AD1CSSLbits.CSS0 = 1;
    //AD1CSSLbits.CSS1 = 1;

    //IFS0bits.AD1IF = 0; //Clear the A/D interrupt flag bit
    //IEC0bits.AD1IE = 1; //Disable A/D interrupts
    AD1CON1bits.ADON = 1;       //enable
    //END ADC SETUP

    //initDma0();

    mcSetup();

    gyroSetup();
    xlSetup();
    dfmemSetup();
//    SetupTimer2();
//
    //swatchSetup();
    sclockSetup();
    timer1Setup();
    cmdSetup();
    
    attSetup(1.0/TIMER1_FCY);
    char j;
    for(j=0; j<6; j++){
        LED_1 = ~LED_1;
        delay_ms(100);
        LED_2 = ~LED_2;
        delay_ms(100);
        LED_3 = ~LED_3;
        delay_ms(100);
    }

    LED_1 = 1;
    LED_2 = 1;
    LED_3 = 1;
   
    //radioDeleteQueues();
    while(1){
        cmdHandleRadioRxBuffer();
        radioProcess();
    }
    return 0;
}
