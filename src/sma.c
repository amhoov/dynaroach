#include "sma.h"
#include <stdlib.h>

SmaConfig smaCreateConfig(void)
{
    SmaConfig sma = (SmaConfig)malloc(sizeof(SmaConfigStruct));
    sma->id = 0;
    sma->dc_heat = 0;
    sma->dc_hold = 0;
    sma->t_heat = 0;

    return sma;
}

void smaConfigure(SmaConfig sma, char id, char dc_heat, int t_heat, char dc_hold)
{
    sma->id = id;
    sma->dc_heat = dc_heat;
    sma->dc_hold = dc_hold;
    sma->t_heat = (long)t_heat * 1000; //Multiply by 1000 because t_heat is in ms, but swatch tics in us
}
