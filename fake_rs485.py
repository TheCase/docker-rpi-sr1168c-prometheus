#!/usr/bin/env python

import serial

serial_device = '/dev/tty.usbserial-A603IU67'
ser = serial.Serial(serial_device, 4800)

#values = bytearray([1])
#ser.write(values)

while True:

    raw = ser.read(8)
    print "got: " + str(map(lambda c: hex(ord(c)), raw))

    ser.write("\x24\x29\x1b\x1f\x00\x00\x00\x20")
    print "sent"
