'''
File: dynaRoACH.py
Author: Aaron M. Hoover
Date: 2012-05-03
Description: A class representing the functionality necessary for testing and
running the dynaRoACH robot.
'''

import sys
import csv
import time
import math

from serial import Serial, SerialException
import numpy as np

from xbee import XBee
from struct import pack, unpack
from operator import attrgetter

from lib import cmd
from lib.basestation import BaseStation
from lib.payload import Payload

kTimeout = 5
kRtscts = 0

kPldStatusIdx = 0
kPldCommandIdx = 1
kPldDataStart = 2

kStatusUnused   = 0x00
kTestRadioCmd   = 0x00
kTestGyroCmd    = 0x01
kTestAccelCmd   = 0x02
kTestDFlashCmd  = 0x03
kTestMotorCmd   = 0x04
kTestSMACmd     = 0x05

kConfigureSMA   = 0x10
kRunTrial       = 0x11

ON = 1
OFF = 0

DEFAULT_BAUD_RATE = 230400
DEFAULT_DEST_ADDR = '\x01\x10'
DEFAULT_DEV_NAME = '/dev/tty.usbserial-A8THYF0S'

SMA_LEFT =  0
SMA_RIGHT = 1

GYRO_LSB2DEG = 0.0695652174  # 14.375 LSB/(deg/s)
GYRO_LSB2RAD = 0.00121414209

DFMEM_PAGE_SIZE = 264
SAMPLE_BYTES = 35


class DynaRoach():
    '''Class representing the dynaRoACH robot'''

    def __init__(self, dev_name=DEFAULT_DEV_NAME, baud_rate=DEFAULT_BAUD_RATE, dest_addr=DEFAULT_DEST_ADDR):
        '''
        Description:
        Initiate the 802.15.4 connection and configure the target.
        Class must be instantiated with a connection name. On Windows this is
        typically of the form "COMX". On Mac, the serial device connection
        string is typically '/dev/tty.DEVICE_NAME-SPP-(1)' where the number at
        the end is optional depending on the version of the OS.


        Inputs:
            dev_name: The device name to connect to. Examples are COM5 or
                      /dev/tty.usbserial.
                print ord(datum)
        '''

        self.dest_addr = dest_addr
        self.last_packet = None
        self.data_cnt = 0
        self.state_data = []
        self.last_sample_count = 0

        self.radio = BaseStation(dev_name, baud_rate, dest_addr, self.receive)

    def receive(self, packet):
        self.last_packet = packet
        pld = Payload(packet.get('rf_data'))
        typeID = pld.type
        data = pld.data

        if typeID == kTestAccelCmd or typeID == kTestGyroCmd:
            print unpack('3h', data)
        elif typeID == kTestDFlashCmd:
            print ''.join(data)
        elif typeID == kTestMotorCmd:
            print unpack('50H', data)
        elif typeID == cmd.TEST_BATT:
            print unpack('2H', data)
        elif typeID == cmd.TX_SAVED_DATA:
            datum = list(unpack('<L3f5HB4H', data))
            self.state_data.append(datum)
            self.data_cnt += 1
        elif typeID == cmd.GET_SAMPLE_COUNT:
            self.last_sample_count = unpack('H', data)[0]
            print('Last sample count %d' % self.last_sample_count)
            #datum = list(unpack('LFFFHHHHHBHHHH', data))
            #print(datum)


    def echo(self):
        '''
        Description:
            This test sends three packets to the target requesting
            it echo them back. The results should be the
            receipt of three packets. The payloads of those three packets
            should print as consecutive integers 0-9, 10-19, and 20-29
            respectively.
        '''

        for i in range(1, 4):
            data_out = ''.join([chr(datum) for datum in range((i-1)*10,i*10)])
            print("Transmitting data " + str(i) + "...")
            self.radio.send(0, cmd.ECHO, data_out)
            time.sleep(0.2)
            self.print_packet(self.last_packet)
            print('\n')
            print('\n')
            time.sleep(1)

    def configureTrial(self, trial):
        '''
            Description:
                Configure trial parameters.
            Parameters:
                trial: The trial configuration to be saved.
        '''

        data_out = trial.toCmdData()
        self.radio.send(kStatusUnused, cmd.CONFIG_TRIAL, data_out)


    def configureSMA(self, sma):
        '''
            Description:
                Configure SMA actuation parameters
            Parameters:
                sma: the sma configuration to be saved. 
        '''

        data_out = sma.toCmdData()
        self.state_data = []
        self.data_cnt = 0
        self.radio.send(kStatusUnused, cmd.CONFIG_SMA, data_out)

    def runTrial(self):
        '''
            Description:
                Start a trial running.
            Parameters:
                trial: The configured trial to be executed.
        '''

        self.radio.send(kStatusUnused, cmd.RUN_TRIAL, [])

    def run_gyro_calib(self, num_samples=2000):
        print("Calibrating gyroscope...")
        self.radio.send(0, cmd.RUN_GYRO_CALIB, [num_samples])

    def test_gyro(self):
        '''
        Description:
            Read the XYZ values from the gyroscope.
        '''

        print("Testing gyroscope...")
        self.radio.send(0, cmd.TEST_GYRO, [])

    def test_accel(self):
        '''
        Description:
            Read the XYZ values from the accelerometer.
        '''


        print("Testing accelerometer...")
        self.radio.send(0, cmd.TEST_ACCEL, [])

    def test_dflash(self):
        '''
        Description:
            Read out a set of strings that have been written to and read from
            memory.
        '''

        print("Testing data flash...")
        self.radio.send(0, cmd.TEST_DFLASH, [])

    def test_motor(self, motor_id, time, duty_cycle, direction, return_emf=0):
        '''
        Description:
            Turn on a motor.
        Parameters:
            motor_id    : The motor number to turn on
            time        : The amount of time to turn the motor on for (in
                          seconds)
            duty_cycle  : The duty cycle of the PWM signal used to control the
                          motor in percent (0 - 100) 
            direction   : The direction to spin the motor. There are *three*
                          options for this parameter. 0 - reverse, 1 - forward, 
                          2 high impedance motor controller output = braking
            return_emf  : Send the back emf readings over the radio channel.
        '''

        if direction >= 2:
            direction = 2
        elif direction <= 0:
            direction = 0
        else:
            direction = 1


        if return_emf != 1:
            return_emf = 0

        data_out = chr(kStatusUnused) + chr(kTestMotorCmd) + chr(motor_id) + \
                   chr(time) + chr(duty_cycle) + chr(direction) + \
                   chr(return_emf)
        if(self.check_conn()):
            self.radio.tx(dest_addr=self.dest_addr, data=data_out)

    def test_sma(self, chan_id, time, duty_cycle):
        '''
        Description:
            Turn on an SMA
        Parameters:
            chan_id     : The SMA channel to turn on
            time        : The amount of time to turn the SMA on for (in
                          seconds)
            duty_cycle  : The duty cycle of the PWM signal used to control the
                          SMA in percent (0 - 100)
        '''

        if(duty_cycle < 0 or duty_cycle > 100):
            print("You entered an invalid duty cycle.")
            return

        data_out = chr(kStatusUnused) + chr(kTestSMACmd) + chr(chan_id) + \
                   chr(time) + chr(duty_cycle)

        if(self.check_conn()):
            self.radio.tx(dest_addr=self.dest_addr, data=data_out)

    def test_hall(self):
        self.radio.send(0, cmd.TEST_HALL, [])

    def test_batt(self):
        data = ''.join(chr(0) for i in range(4))
        self.radio.send(0, cmd.TEST_BATT, data)

    def get_sample_count(self):
        self.radio.send(0, cmd.GET_SAMPLE_COUNT, pack('H', 0))

    def transmit_saved_data(self):
        self.data_cnt = 0
        start_page = 0x100
        self.get_sample_count()
        time.sleep(0.5)
        if(self.last_sample_count == 0):
            print("There is no previously saved data.")
            return
        else:
            self.radio.send(0, cmd.TX_SAVED_DATA, pack('3H', start_page, self.last_sample_count, SAMPLE_BYTES))

    def erase_mem_sector(self, sector):
        self.radio.send(0, cmd.ERASE_MEM_SECTOR, pack('H', sector))

    def print_packet(self, packet):
        '''
        Description:
            Print the contents of a packet to the screen. This function
            will primarily be used for debugging purposes. May need to
            replace print with stdio or stderr to accommodate GUI test
            suite.
        '''
        if(packet is not None):
            print("Received the following: ")
            print("RSSI: " + str(ord(packet.get('rssi'))))
            (src_h, src_l) = unpack('cc', packet.get('source_addr'))
            print("Source Address: 0x%.2X 0x%.2X" % (ord(src_h),
                  ord(src_l)))
            print("ID: " + (packet.get('id')))
            print("Options: " + str(ord(packet.get('options'))))
            rf_data = packet.get('rf_data')
            print("Status Field: " + str(ord(rf_data[0])))
            print("Type Field: " + str(ord(rf_data[1])))
            print("Payload Data: " + ''.join([str(ord(i)) for i in rf_data[2:]]))

    def save_trial_data(self, fname):
        print('%d total state data were received.' % self.data_cnt)
        state_data_arr = np.array(self.state_data)
        fmt = '%d, %f, %f, %f, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d'
        np.savetxt(fname, state_data_arr, fmt)
        print("State data saved to file: " + fname)


    def __del__(self):
        '''
        Description:
            Clean up the connection when the object is deleted.
        '''
        try:
            self.conn.close()
        except AttributeError:
            pass


class Trial():
    def __init__(self):
        self.state_transitions = []
        self.save_data = True

    def toCmdData(self):
        cmdData = ''
        self.state_transitions = sorted(self.state_transitions,
                     key=attrgetter('timestamp'))
        #tmp = sorted(self.state_transitions,
        #             key=attrgetter('timestamp'))
        #self.state_transitions = tmp
        cmdData += pack('B', self.save_data)
        for st in self.state_transitions:
            cmdData += pack('H', st.timestamp)
            cmdData += pack('B', st.cmd)
            for param in st.params:
                cmdData += pack('B', param)
        return cmdData

    def saveToFile(self, fname):
        outfile = open(fname, 'w')
        outfile.write('%d\n' % self.save_data)
        for t in self.state_transitions:
            outfile.write('%d, %d, %d, %d \n' % (t.timestamp, t.cmd, t.params[0], \
                     t.params[1]))
        outfile.flush()
        outfile.close()

    def loadFromFile(self, fname):
        try:
            infile = open(fname, 'r')
            self.save_data = (bool)((int)(infile.readline().rstrip('\n')))
            for line in infile.readlines():
                st = line.rstrip('\n').split(',')
                print(st)
                self.state_transitions.append(StateTransition(int(st[0]),\
                                                              int(st[1]),\
                                                              [int(st[2]),\
                                                              int(st[3])]))
        except IOError:
            'File doesn\'t exist. Try again.'



class SMA():
    def __init__(self):
        self.id = 0
        self.dc_high = 0
        self.hot_time = 0
        self.dc_low = 0

    def toCmdData(self):
        cmdData = pack('BBHB', self.id, self.dc_high, self.hot_time, self.dc_low)
        return cmdData

class StateDatum():

    def __init__(self):
        self.timestamp = 0
        self.back_emf = 0
        self.xl = AccelState()
        self.gyro = GyroState()
        self.encoder_pos = 0
        self.hall_state = 0
        self.v_batt = 0

class AccelState():

    def __init__(self, packed_fields=None):
        if(packed_fields):
            (self.x, self.y, self.z) = unpack('hhh', packed_fields)
        else:
            (self.x, self.y, self.z) = (0, 0, 0)

class GyroState():

    def __init__(self, packed_fields=None):
        if (packed_fields):
            (self.rot_x, self.rot_y, self.rot_z) = unpack('hhh', packed_fields)
        else:
            (self.rot_x, self.rot_y, self.rot_z) = (0, 0, 0)

class StateTransition():

    def __init__(self, ts=0, cmd=0, params=[]):
        self.timestamp = ts
        self.cmd = cmd
        self.params = params

