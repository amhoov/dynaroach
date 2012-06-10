#ifndef __CMD_H
#define __CMD_H

typedef union {
    float fval;
    unsigned long lval;
    short sval[2];
    unsigned char cval[4];
} uByte4;

typedef union {
    unsigned short sval;
    unsigned char cval[2];
} uByte2;

extern unsigned volatile int ADCBuffer[1] __attribute__((space(dma)));

void cmdSetup(void);
void cmdHandleRadioRxBuffer(void);

#endif // __CMD_H
