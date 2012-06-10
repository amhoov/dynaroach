#ifndef __CONSTS_H
#define __CONSTS_H

#define ADC_MAX             1023
#define PI                  3.14159265

//Limits for numerical values of different types
#define INT_MIN             -32768
#define INT_MAX             32767
#define UINT_MAX            65535
#define UINT_MIN            0

//Status field identifiers (currently unused)
#define STATUS_UNUSED       0

//Communication constants
#define TX_PAYLOAD_SIZE     128 

//Timer constants
#define FT1                 100

#define ON                  1
#define OFF                 0

#define MD_LED_1                _LATB8
#define MD_LED_2                _LATB11
#define SMA_1                   1
#define SMA_2                   2


#define MAX_TEST_FUNC_SIZE  0x10
#define MAX_CMD_FUNC_SIZE   0x20 


//Testing constants
#define CMD_TEST_RADIO          0x00 
#define CMD_TEST_GYRO           0x01
#define CMD_TEST_ACCEL          0x02
#define CMD_TEST_DFLASH         0x03 
#define CMD_TEST_MOTOR          0x04
#define CMD_TEST_SMA            0x05
#define CMD_TEST_HALL           0x06
#define CMD_TEST_BATT           0x07
#define CMD_ERASE_MEM_SECTOR    0x08
#define CMD_GET_SAMPLE_COUNT    0x09
#define CMD_RUN_GYRO_CALIB      0x0A

#define TEST_PACKET_INTERVAL_MS 1000
#define NUM_TEST_PACKETS        10
#define IMU_DATA_LEN            6
#define MEM_START_PAGE          0x100

//Command constants
#define CMD_CONFIGURE_SMA   0x10
#define CMD_CONFIGURE_TRIAL 0x11
#define CMD_RUN_TRIAL       0x12
#define CMD_TX_SAVED_DATA   0x13
#define CMD_SET_MOTOR       0x14
#define CMD_SET_SMA         0x15
#define CMD_SET_SAVE_DATA   0x16
#define CMD_ECHO            0x1F

#define TIMER1_FCY          250

#endif
