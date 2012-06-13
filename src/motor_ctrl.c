#include "motor_ctrl.h"
#include "pwm.h"
#include "ports.h"
#include "consts.h"
#include "libqw.h"
#include <libq.h>

//Delete utils include when finished with LEDs
#include "utils.h"

static unsigned int pwmPeriod;
static _Q16 dutyCycleQ;

static void mcSetupPeripheral(void);

void mcSetup(void)
{
    mcSetupPeripheral();
	dutyCycleQ = _IQ16div(_Q16ftoi(pwmPeriod), _Q16ftoi(50.0));
}

void mcSetDutyCycle(unsigned char channel, float duty_cycle)
{
    _Q16 temp = _Q16mult(dutyCycleQ, _Q16ftoi(duty_cycle));
    unsigned int pdc_value = (unsigned int) _itofQ16(temp);
    SetDCMCPWM(channel, pdc_value, 0);

}

static void mcSetupPeripheral(void)
{
    TRISB = 0b0000011011111011;

    int i;
    for (i=0; i<6; ++i)
    {
        MD_LED_1 = ~MD_LED_1;
        MD_LED_2 = ~MD_LED_2;
        delay_ms(150);
    }

    pwmPeriod = 4999;

    ConfigIntMCPWM(PWM_INT_DIS & PWM_FLTA_DIS_INT & PWM_FLTB_DIS_INT);

    PTPER = pwmPeriod;
    SEVTCMP = 160; //Special event compare value to sample ADC in phase with PWM

    PWMCON1bits.PMOD1 = 1;
    PWMCON1bits.PMOD2 = 1;
    PWMCON1bits.PMOD3 = 1;
    
    PWMCON1bits.PEN1H = 1;
    PWMCON1bits.PEN2H = 1;
    PWMCON1bits.PEN3H = 1;
    PWMCON1bits.PEN1L = 1;
    PWMCON1bits.PEN2L = 1;
    PWMCON1bits.PEN3L = 1;
    
    PWMCON2bits.SEVOPS = 0; // postscale 1:1
    PWMCON2bits.OSYNC = 0;
    PWMCON2bits.UDIS = 0;
    
    PTCONbits.PTMOD = 0; // Free running mode
    PTCONbits.PTOPS = 0; // postscale 1:1
    PTCONbits.PTCKPS = 0b10; // prescale 1:16
    PTCONbits.PTSIDL = 0; // runs in CPU idle mode
    PTCONbits.PTEN = 1;

    //P1OVDCONbits.POVD1L = 1;
    //P1OVDCONbits.POVD1H = 0;
    //P1OVDCONbits.POUT1H = 0;

    P1OVDCONbits.POVD1L = 0; 
    P1OVDCONbits.POVD1H = 1; 
    P1OVDCONbits.POUT1L = 0;

}

