#include "statetransition.h"
#include "sclock.h"
#include <stdlib.h>


StateTransition stCreateConfig(void)
{
    StateTransition st = (StateTransition)malloc(sizeof(StateTransitionStruct));
    st->timestamp = 0;
    st->cmd = 0;
    unsigned char* params = (unsigned char*)malloc(MAX_PARAMS);
    st->params = params;
    return st;
}


void stConfigure(StateTransition st, unsigned int timestamp, unsigned char cmd)
{
    st->timestamp = (long)timestamp * (long)sclockGetMillisFactor(); //Convert from ms to system clock ticks 
    st->cmd = cmd;
}
