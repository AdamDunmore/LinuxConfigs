#!/usr/bin/env python3

import subprocess
import sys

def scan():        
    result = subprocess.run(['bluetoothctl', '--timeout', '3s', 'scan', 'on'], stdout=subprocess.PIPE).stdout.decode('utf-8')

    lines = result.split("\n")

    for x in range(3,len(lines)):
        #print(lines[x])
        word = ""
        for y in lines[x][46:]:
            if y == ":":
                break
            word += y
        print(word)

def connect(name):
    result = subprocess.run(['bluetoothctl', '--timeout', '3s', 'scan', 'on'], stdout=subprocess.PIPE).stdout.decode('utf-8')
    print(result)

if len(sys.argv) > 1:
    if sys.argv[1] == "-s":
        scan()
    elif sys.argv[1] == "-c":
        connect(sys.argv[2])
