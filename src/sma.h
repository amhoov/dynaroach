#ifndef __SMA_H
#define __SMA_H

#define SMA_RIGHT   0
#define SMA_LEFT    1
#define SMA_HEATING 0
#define SMA_HOLDING 1     
#define SMA_OFF     2

typedef struct {
    char id;
    char dc_heat;
    char dc_hold;
    unsigned long t_heat; //time in us to hold the heating portion the actuator cycle 
    char state;
} SmaConfigStruct;

typedef SmaConfigStruct* SmaConfig;

SmaConfig smaCreateConfig(void);
void smaConfigure(SmaConfig sma, char id, char dc_heat, int t_heat, char dc_hold);

#endif
