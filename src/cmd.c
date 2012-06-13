#include "p33Fxxxx.h"
#include "cmd.h"
//#include "radio_dma.h"
#include "radio.h"
#include "mac_packet.h"
#include "dfmem.h"
#include "sma.h"
#include "motor_ctrl.h"
#include "attitude_q.h"
#include "payload.h"
#include "consts.h"
#include "network.h"
#include "utils.h"
//#include "stopwatch.h"
#include "sclock.h"
#include "statetransition.h"
#include "led.h"
#include "adc.h"
#include <stdlib.h>
#include <string.h>


#define FLASH_8MBIT_BYTES_PER_PAGE          264

static union {
    struct {
        unsigned int page;
        unsigned int byte;
    } index;
    unsigned char chr_index[4]; 
} MemLoc;


unsigned volatile int ADCBuffer[1] __attribute__((space(dma)));

static SmaConfig sma_left;
static SmaConfig sma_right;
static unsigned char saveData2Flash = 0;
static unsigned char st_cnt;
static uByte2 sample_cnt;

void(*cmd_func[MAX_CMD_FUNC_SIZE])(unsigned char, unsigned char, unsigned char*);

StateTransition* stTable;
unsigned char st_idx;
static unsigned long trial_start_time = 0;

static void cmdNop(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdTxSavedData(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdConfigureSma(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdConfigureTrial(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdRunTrial(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdEcho(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdSetMotor(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdSetSma(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdTestRadio(unsigned char status, unsigned char length, unsigned char* frame);
static void cmdTestAccel(unsigned char status, unsigned char length, unsigned char* frame);
static void cmdTestGyro(unsigned char status, unsigned char length, unsigned char* frame);
static void cmdTestDflash(unsigned char status, unsigned char length, unsigned char* data);
static void cmdEraseMemSector(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdTestHall(unsigned char status, unsigned char length, unsigned char* frame);
static void cmdTestBatt(unsigned char status, unsigned char length, unsigned char* frame);
static void cmdGetSampleCount(unsigned char status, unsigned char length, unsigned char *frame);
static void cmdRunGyroCalib(unsigned char status, unsigned char length, unsigned char *frame);

static void send(unsigned char status, unsigned char length, unsigned char *frame, unsigned char type);

//Delete these once trackable management code is working

static unsigned char tls = 0;
static unsigned char trs = 0;
static unsigned char tms = 0;

void cmdSetup(void)
{
    unsigned int i;

    for(i = 0; i < MAX_CMD_FUNC_SIZE; ++i)
    {
        cmd_func[i] = &cmdNop;
    }

    cmd_func[CMD_TX_SAVED_DATA] = &cmdTxSavedData;
    cmd_func[CMD_ECHO] = &cmdEcho;
    cmd_func[CMD_CONFIGURE_TRIAL] = &cmdConfigureTrial;
    cmd_func[CMD_CONFIGURE_SMA] = &cmdConfigureSma;
    cmd_func[CMD_RUN_TRIAL] = &cmdRunTrial;
    cmd_func[CMD_SET_MOTOR] = &cmdSetMotor;
    cmd_func[CMD_SET_SMA] = &cmdSetSma;
    cmd_func[CMD_RUN_GYRO_CALIB] = &cmdRunGyroCalib;
    cmd_func[CMD_TEST_ACCEL] = &cmdTestAccel;
    cmd_func[CMD_TEST_GYRO] = &cmdTestGyro;
    cmd_func[CMD_TEST_DFLASH] = &cmdTestDflash;
    cmd_func[CMD_TEST_HALL] = &cmdTestHall;
    cmd_func[CMD_TEST_BATT] = &cmdTestBatt;
    cmd_func[CMD_ERASE_MEM_SECTOR] = &cmdEraseMemSector;
    cmd_func[CMD_GET_SAMPLE_COUNT] = &cmdGetSampleCount;
    cmd_func[CMD_RUN_GYRO_CALIB] = &cmdRunGyroCalib;
}

static void cmdSetMotor(unsigned char status, unsigned char length, unsigned char *frame)
{
    mcSetDutyCycle(frame[0], frame[1]);
}

static void cmdSetSma(unsigned char status, unsigned char length, unsigned char *frame)
{
    if(frame[0] == SMA_LEFT)
    {
        P1OVDCONbits.POVD3L = 1; 
        P1OVDCONbits.POVD3H = 0; 
        P1OVDCONbits.POUT3H = 0; 
    }else if (frame[0] == SMA_RIGHT)
    {
        P1OVDCONbits.POVD3H = 1; 
        P1OVDCONbits.POVD3L = 0; 
        P1OVDCONbits.POUT3L = 0;
    }
    mcSetDutyCycle(3, frame[1]); //Hardcoded "3" needs to go
}


void cmdHandleRadioRxBuffer(void)
{
    MacPacket packet;
    Payload pld;
    unsigned char command, status;
    
    if((packet = radioDequeueRxPacket()) != NULL)
    {
        pld = macGetPayload(packet);
        status = payGetStatus(pld);
        command = payGetType(pld);
        if(command < MAX_CMD_FUNC_SIZE)
        {
            cmd_func[command](status, payGetDataLength(pld), payGetData(pld));
        }
        radioReturnPacket(packet);
    }
    return;
}

static void cmdTxSavedData(unsigned char status, unsigned char length, unsigned char *frame)
{
    unsigned int start_page = frame[0] + (frame[1] << 8);
    //unsigned int end_page = frame[2] + (frame[3] << 8);
    unsigned int num_samples = frame[2] + (frame[3] << 8);
    unsigned int tx_data_size = frame[4] + (frame[5] << 8);
    unsigned int i, j;

    unsigned int end_page;

    MacPacket packet;
    Payload pld;


    LED_1 = 0;
    LED_2 = 1;
    LED_3 = 0;

    unsigned int read = 0;
    i = start_page;
    while(read < num_samples + 100)
    {
        j = 0;
        while (j + tx_data_size <= 264) {
            packet = radioRequestPacket(tx_data_size);
            if(packet == NULL)
            {
                continue;
            }
            macSetDestPan(packet, NETWORK_BASESTATION_PAN_ID);
            macSetDestAddr(packet, NETWORK_BASESTATION_ADDR);
            pld = macGetPayload(packet);
            dfmemRead(i, j, tx_data_size, payGetData(pld));
            paySetType(pld, CMD_TX_SAVED_DATA);
            if(radioEnqueueTxPacket(packet))
            {
                radioProcess();
            }
            delay_ms(5);
            j += tx_data_size;
            read++;
        }

        i++;

        if ((i >> 7) & 0x1) {
            LED_1 = ~LED_1;
            LED_2 = ~LED_2;
        }
    }

    LED_1 = 1;
    LED_2 = 1;
    LED_3 = 1;
    delay_ms(2000);
    LED_1 = 0;
    LED_2 = 0;
    LED_3 = 0;
}

static void cmdConfigureSma(unsigned char status, unsigned char length, unsigned char *frame)
{
    uByte2 hot_time;

    hot_time.cval[0] = frame[2];
    hot_time.cval[1] = frame[3];

    if(frame[0] == SMA_LEFT)
    {
        sma_left = smaCreateConfig();
        smaConfigure(sma_left, frame[0], frame[1], hot_time.sval, frame[4]);
    }
    else if (frame[0] == SMA_RIGHT)
    {
        sma_right = smaCreateConfig();
        smaConfigure(sma_right, frame[0], frame[1], hot_time.sval, frame[4]);
    }

    int i;
    for (i=0; i<6; i++) 
    {
        LED_3 = ~LED_3;
        delay_ms(150);
    }
    LED_3 = 1;
}

static void cmdConfigureTrial(unsigned char status, unsigned char length, unsigned char *frame)
{
    char n_cmds;
    uByte2 timestamp;
    StateTransition st;

    st_cnt = length / ST_NUM_BYTES; 
    stTable = (StateTransition*)malloc(st_cnt*sizeof(StateTransition));

    saveData2Flash = frame[0];

    if (saveData2Flash == 1)
    {
        MemLoc.index.page = MEM_START_PAGE;
        MemLoc.index.byte = 0;
    }

    int i;
    for (i=0; i<st_cnt; i++) 
    {
        st = stCreateConfig();
        timestamp.cval[0] = frame[ST_NUM_BYTES*i + 1];
        timestamp.cval[1] = frame[ST_NUM_BYTES*i + 2];
        stConfigure(st, timestamp.sval, frame[ST_NUM_BYTES*i + 3]);
        st->params[0] = frame[ST_NUM_BYTES*i + 4];
        st->params[1] = frame[ST_NUM_BYTES*i + 5];
        stTable[i] = st;
    }
    
    for (i=0; i<6; i++) 
    {
        LED_3 = ~LED_3;
        delay_ms(150);
    }
    LED_3 = 1;

}

static void cmdRunTrial(unsigned char status, unsigned char length, unsigned char *frame)
{
    st_idx = 0;
    attSetEstimateRunning(1);
    trial_start_time = sclockGetLocalTicks();
    sample_cnt.sval = 0;
    _T1IE = 1;
}



static void cmdEcho(unsigned char status, unsigned char length, unsigned char *frame)
{
    send(status, length, frame, CMD_ECHO);
}



/*****************************************************************************
* Function Name : cmdTestAccel 
* Description   : Create and send out over the radio a number of test packets that 
*                 contain the three X,Y, and Z values read from the
*                 accelerometer.
* Parameters    : status - Status field of the accelerometer test packet (not yet used)
*                 length - The length of the payload data array
*                 data - not used
*****************************************************************************/
static void cmdTestAccel(unsigned char status, unsigned char length, unsigned char* frame)
{
    int i;

    for (i=0; i < NUM_TEST_PACKETS; i++)
    {
        LED_1 = ~LED_1;
        send(status, IMU_DATA_LEN, xlReadXYZ(), CMD_TEST_ACCEL);
        delay_ms(TEST_PACKET_INTERVAL_MS);
    }

    LED_1 = OFF;
}

static void cmdRunGyroCalib(unsigned char status, unsigned char length, unsigned char *frame)
{
    unsigned int count = frame[0] + (frame[1] << 8);

    LED_GRN = 1; LED_RED = 0; LED_YLW = 1;

    gyroRunCalib(count);

    LED_GRN = 0; LED_YLW = 0;
}

/*****************************************************************************
* Function Name : cmdTestGyro 
* Description   : Create and send out over the radio a number of test packets that 
*                 contain the three X,Y, and Z values read from the gyro.
* Parameters    : status - Status field of gyro test packet (not yet used)
*                 length - The length of the payload data array
*                 frame - not used
*****************************************************************************/
static void cmdTestGyro(unsigned char status, unsigned char length, unsigned char* frame)
{   
    int i;

    for(i=0; i<NUM_TEST_PACKETS; i++)
    {
        LED_1 = ~LED_1;
        send(status, IMU_DATA_LEN, gyroReadXYZ(), CMD_TEST_GYRO);
        delay_ms(TEST_PACKET_INTERVAL_MS);
    }
    LED_1 = OFF;
}

/*****************************************************************************
* Function Name : cmdTestHall
* Description   : For 10 seconds, set the state of LED_2 based on the state
*                 of the Hall effect sensor connected to RB7. User needs 
*                 to manually try to switch the state of the Hall effect
*                 sensor. Current hardware implementation uses a latched 
*                 Hall (Melexis US1881).
* Parameters    : status - Status field of gyro test packet (not yet used)
*                 length - The length of the payload data array
*                 frame - not used
*****************************************************************************/
static void cmdTestHall(unsigned char status, unsigned char length, unsigned char* frame)
{

    //LED_2 = 0;
    //LED_3 = 0;
    //while(swatchToc() < 10000000)
    //{
    //    LED_1 = PORTBbits.RB7;
    //}
    //LED_2 = 1;
    //LED_3 = 1;
    return;
}

static void cmdTestBatt(unsigned char status, unsigned char length, unsigned char* frame)
{
    uByte2 v_batt;
    AD1CHS0bits.CH0SA = 0b00000;
    AD1CON1bits.SAMP = 1;
    while(!AD1CON1bits.DONE);
    AD1CON1bits.SAMP = 0;
    AD1CON1bits.DONE = 0;
    MD_LED_1 = ~MD_LED_1;

    v_batt.sval = ADCBUF0;
    frame[0] = v_batt.cval[0];
    frame[1] = v_batt.cval[1];

    
    AD1CHS0bits.CH0SA = 0b00001;      //Select AN0 for CH0 +ve input
    AD1CON1bits.SAMP = 1;
    while(!AD1CON1bits.DONE);
    AD1CON1bits.SAMP = 0;
    AD1CON1bits.DONE = 0;
    v_batt.sval = ADCBUF0;
    frame[2] = v_batt.cval[0];
    frame[3] = v_batt.cval[1];

    send(status, 4, frame, CMD_TEST_BATT);
}

/*****************************************************************************
* Function Name : cmdTestDflash 
* Description   : Write four different strings to a page in the data flash,
*                 then read them back and send their contents out over the
*                 radio. Bonus points if you can identify the film without 
*                 reverting to the internet.
* Parameters    : status - Status field of the dflash test packet (not yet used)
*                 length - The length of the payload data array
*                 data - not used
*****************************************************************************/
static void cmdTestDflash(unsigned char status, unsigned char length, unsigned char* frame)
{
    Payload pld; 

    unsigned char mem_data[256] = {};
    unsigned char *str1 = "You must be here to fix the cable.";  // 38+1
    unsigned char *str2 = "Lord. You can imagine where it goes from here.";  //46+1
    unsigned char *str3 = "He fixes the cable?"; //19+1
    unsigned char *str4 = "Don't be fatuous, Jeffrey."; //26+1

    strcpy(mem_data, str1);
    strcpy(mem_data + strlen(str1), str2);
    strcpy(mem_data + strlen(str1) + strlen(str2), str3);
    strcpy(mem_data + strlen(str1) + strlen(str2) + strlen(str3), str4);

    dfmemWrite (mem_data, sizeof(mem_data), 0x0100, 0, 1);

    pld = payCreateEmpty(strlen(str1));
    dfmemRead(0x0100, 0, strlen(str1),  payGetData(pld));
    send(status, strlen(str1), payGetData(pld), CMD_TEST_DFLASH); 
    payDelete(pld);

    delay_ms(100);
    pld = payCreateEmpty(strlen(str2));
    dfmemRead(0x0100, strlen(str1), strlen(str2), payGetData(pld));
    send(status, strlen(str2), payGetData(pld), CMD_TEST_DFLASH); 

    delay_ms(100);
    pld = payCreateEmpty(strlen(str3));
    dfmemRead(0x0100, strlen(str1) + strlen(str2), strlen(str3), payGetData(pld));
    send(status, strlen(str3), payGetData(pld), CMD_TEST_DFLASH); 

    delay_ms(100);
    pld = payCreateEmpty(strlen(str4));
    dfmemRead(0x0100, strlen(str1) + strlen(str2) + strlen(str3), strlen(str4), payGetData(pld));
    send(status, strlen(str4), payGetData(pld), CMD_TEST_DFLASH); 

    payDelete(pld);

}

static void cmdEraseMemSector(unsigned char status, unsigned char length, unsigned char *frame)
{
    uByte2 page;
    page.cval[0] = frame[0];
    page.cval[1] = frame[1];

    LED_3 = 0;
    dfmemEraseSector(page.sval);
    LED_3 = 1;
}

static void cmdGetSampleCount(unsigned char status, unsigned char length, unsigned char *frame)
{
    frame[0] = sample_cnt.cval[0];
    frame[1] = sample_cnt.cval[1];
    send(status, 2, frame, CMD_GET_SAMPLE_COUNT); 
}

static void cmdNop(unsigned char status, unsigned char length, unsigned char *frame)
{
    Nop();
}

static void send(unsigned char status, unsigned char length, unsigned char *frame, unsigned char type)
{
    MacPacket packet;
    Payload pld;

    packet = radioRequestPacket(length);
    if(packet == NULL)
    {
        return;
    }
    macSetDestPan(packet, NETWORK_BASESTATION_PAN_ID);
    macSetDestAddr(packet, NETWORK_BASESTATION_ADDR);
    pld = macGetPayload(packet);
    paySetData(pld, length, frame);
    paySetType(pld, type);
    //while(!radioEnqueueTxPacket(packet)){radioProcess();}
    if(radioEnqueueTxPacket(packet))
    {
        radioProcess();
    }
}

void __attribute__((interrupt, no_auto_psv)) _T1Interrupt(void)
{
    uByte4 t_ticks, yaw, pitch, roll, vdotx, vdoty, vdotz;
    uByte2 bemf, v_batt, pot_val;
    unsigned char hall_state = 0;

    unsigned char* xlXYZ;
    unsigned char kDataLength = 35;
    unsigned char buffer[kDataLength];
    static unsigned char buf_idx = 1;
    StateTransition st;
    int i;

    st = stTable[st_idx];

    t_ticks.lval = sclockGetLocalTicks() - trial_start_time;
    //Get pose estimates
    if(attIsRunning())
    {
        attReadSensorData();
        attEstimatePose();
        yaw.fval = attGetYaw();
        pitch.fval = attGetPitch();
        roll.fval  = attGetRoll();
        xlXYZ = xlToString();
    }
    
    //Sample back EMF
    AD1CHS0bits.CH0SA = 0b00001;      //Select AN1 (back EMF) for sampling
    AD1CON1bits.SAMP = 1;
    while(!AD1CON1bits.DONE);
    AD1CON1bits.SAMP = 0;
    AD1CON1bits.DONE = 0;
    bemf.sval = ADC1BUF0;

    //Sample battery voltage
    AD1CHS0bits.CH0SA = 0b00000;      //Select AN0 (battery voltage) for sampling
    AD1CON1bits.SAMP = 1;
    while(!AD1CON1bits.DONE);
    AD1CON1bits.SAMP = 0;
    AD1CON1bits.DONE = 0;
    v_batt.sval = ADC1BUF0;

    //Get the state of the hall effect sensor
    hall_state = PORTBbits.RB7;

    while (st->timestamp < t_ticks.lval)
    {
        // Begin trackable switching code
        if(st->cmd == CMD_SET_MOTOR)
        {
            if(st->params[1] > 0 && tms == 0)
            {
                MD_LED_1 = 1;
                MD_LED_2 = 1;
                tms = 1;
            }else if(st->params[1] == 0 && tms == 1)
            {
                MD_LED_1 = 0;
                MD_LED_2 = 0;
                tms = 0;
            }
        }else if (st->cmd == CMD_SET_SMA)
        {
            if(st->params[0] == SMA_LEFT)
            {
                if(st->params[1] > 0 && tls == 0)
                {
                    MD_LED_1 = 0;
                    tls = 1;
                }else if (st->params[1] == 0 && tls == 1)
                {
                    MD_LED_1 = 1;
                    tls = 0;
                }
            }else if(st->params[0] == SMA_RIGHT)
            {
                if(st->params[1] > 0 && trs == 0)
                {
                    MD_LED_2 = 0;
                    trs = 1;
                }else if (st->params[1] == 0 && trs == 1)
                {
                    MD_LED_2 = 1;
                    trs = 0;
                }
            }
        }

        cmd_func[st->cmd](STATUS_UNUSED, 2, st->params);
        st_idx++;
        if (st_idx == st_cnt)
        {
            attSetEstimateRunning(0);
            MD_LED_1 = 0;
            MD_LED_2 = 0;
            //Turn off SMA
            mcSetDutyCycle(3, 0);
            //Turn off Motor
            mcSetDutyCycle(1, 0);
            _T1IE = 0;
            break;
        }else
        {
            st = stTable[st_idx];
        }
    }

    if (saveData2Flash == 1)
    {
        for(i = 0; i < 4; i++)
        {
            buffer[i] = t_ticks.cval[i];
            buffer[i+4] = yaw.cval[i];
            buffer[i+8] = pitch.cval[i];
            buffer[i+12] = roll.cval[i];
        }
        
        buffer[16] = xlXYZ[0];
        buffer[17] = xlXYZ[1];
        buffer[18] = xlXYZ[2];
        buffer[19] = xlXYZ[3];
        buffer[20] = xlXYZ[4];
        buffer[21] = xlXYZ[5];
        buffer[22] = bemf.cval[0];
        buffer[23] = bemf.cval[1];
        buffer[24] = 0; 
        buffer[25] = 0;
        buffer[26] = hall_state;
        buffer[27] = v_batt.cval[0];
        buffer[28] = v_batt.cval[1];

        gyroDumpData(buffer+29);

        dfmemWriteBuffer(buffer, kDataLength, MemLoc.index.byte, buf_idx);
        MemLoc.index.byte += kDataLength;
        sample_cnt.sval++;
        if(MemLoc.index.byte + kDataLength > 264)
        {
            dfmemWriteBuffer2MemoryNoErase(MemLoc.index.page++, buf_idx);
            MemLoc.index.byte = 0;
            buf_idx ^= 0x01;
        }
    }

    _T1IF = 0;
}
