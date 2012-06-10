#ifndef __STATE_TRANSITION_H
#define __STATE_TRANSITION_H

#define MAX_PARAMS      2
#define ST_NUM_BYTES    5

typedef struct {
    unsigned long   timestamp;
    unsigned char   cmd;
    unsigned char*  params;
} StateTransitionStruct;

typedef StateTransitionStruct* StateTransition;
StateTransition stCreateConfig(void);
void stConfigure(StateTransition st, unsigned int timestamp, unsigned char cmd);

#endif //__STATE_TRANSITION_H
