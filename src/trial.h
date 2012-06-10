#ifndef __TRIAL_H
#define __TRIAL_H

typedef struct {
    char            duty_cycle;
    unsigned long   time;
    unsigned long   sma_l_on;
    unsigned long   sma_l_off;
    unsigned long   sma_r_on;
    unsigned long   sma_r_off;
    char            closed_loop;
    char            is_running;
} TrialDescriptorStruct;

typedef TrialDescriptorStruct* TrialDescriptor;

TrialDescriptor trialCreateConfig(void);
void trialConfigure(TrialDescriptor trial, int time, unsigned char duty_cycle, int sma_l_on, int sma_l_off, int sma_r_on, int sma_r_off, char closed_loop);

#endif //__TRIAL_H 
