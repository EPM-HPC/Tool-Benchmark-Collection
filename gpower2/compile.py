#!/usr/bin/python3
import sys
import subprocess
import os
import time
import string
freqs=[]

def readFreq(configFile):
    freq_file=open(configFile)
    lines = freq_file.readlines()
    allfreq = lines[0].strip('\n')
    allfreq = allfreq.split(' ')
    for i in allfreq:
        freqs.append(i)
def samplePower(SMf):
    command='sudo ./gpuPower -d 0 -o '+ str(SMf) + '-e -s 5 -a ./kmeans -o -i kdd_cup '
    print(command)
    subprocess.call(command,shell=True)

if __name__ == "__main__":
    oth=[]
    readFreq("lab-freqConfig.txt")
    for i in range(10):
        for f in freqs:
            #print(len(freqs))
            samplePower(f)
            time.sleep(3)
        sleep(5)
