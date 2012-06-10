#include "trial.h"
#include <stdlib.h>


TrialDescriptor trialCreateConfig(void)
{
    TrialDescriptor trial = (TrialDescriptor)malloc(sizeof(TrialDescriptorStruct));
    trial->time = 0;
    trial->duty_cycle = 0;
    trial->sma_l_on = 0;
    trial->sma_l_off = 0;
    trial->sma_r_on = 0;
    trial->sma_r_off = 0;
    trial->closed_loop = 0;
    trial->is_running = 0;

    return trial;
}


void trialConfigure(TrialDescriptor trial, int time, unsigned char duty_cycle, int sma_l_on, int sma_l_off, int sma_r_on, int sma_r_off, char closed_loop)
{
    trial->time = (long)time * 1000; //stopwatch tics in micrseconds, but run time is specified in milliseconds
    trial->duty_cycle = duty_cycle;
    trial->sma_l_on = (long)sma_l_on * 1000;
    trial->sma_l_off = (long)sma_l_off * 1000;
    trial->sma_r_on = (long)sma_r_on * 1000;
    trial->sma_r_off = (long)sma_r_off * 1000;
    trial->closed_loop = closed_loop; 
}


