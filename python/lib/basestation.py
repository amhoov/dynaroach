#!/usr/bin/python

import time, os, sys
from serial import *
from xbee import XBee
from payload import Payload

class BaseStation(object):

    def __init__(self, port, baud, dest_addr = None, call_back = None):
        try:
            self.ser = Serial(port, baud, timeout = 1)
            if self.ser.isOpen():
                if call_back == None:
                    self.xb = XBee(self.ser)
                else:
                    self.xb = XBee(self.ser, callback = call_back)
            else:
                raise SerialException('')
        except (AttributeError, SerialException):
            print "Unable to open a connection to the target. Please" + \
                  "  verify your basestation is enabled and properly configured."
            raise

        self.ser.writeTimeout = 5
        self.dest_addr = dest_addr

    def close(self):
        try:
            self.xb.halt()
            self.ser.close()
        except (AttributeError, SerialException):
            print "Serial Exception"
            raise

    def send(self, status, type, data ):
        pld = Payload( ''.join(data), status, type )
        self.xb.tx(dest_addr = self.dest_addr, data = str(pld))

    def write(self, data):
        status = 0x00
        type = 0x00
        data_length = len(data)
        start = 0

        while(data_length > 0):
            if data_length > 80:
                self.send( status, type, data[start:start+80] )
                data_length -= 80
                start += 80
            else:
                self.send( status, type, data[start:len(data)] )
                data_length = 0
            time.sleep(0.05)

    def read(self):
        packet = self.xb.wait_read_frame()
        pld = Payload(packet.get('rf_data'))
        #rssi = ord(packet.get('rssi'))
        #(src_addr, ) = unpack('H', packet.get('source_addr'))
        #id = packet.get('id')
        #options = ord(packet.get('options'))
        status = pld.status
        type = pld.type
        data = pld.data
        return data




