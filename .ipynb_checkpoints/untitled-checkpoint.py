import sys
import subprocess
import os
import time

# enter dir
class cd:
    """Context manager for changing the current working directory"""
    def __init__(self, newPath):
        self.newPath = os.path.expanduser(newPath)

    def __enter__(self):
        self.savedPath = os.getcwd()
        os.chdir(self.newPath)

    def __exit__(self, etype, value, traceback):
        os.chdir(self.savedPath)

# CUDA SDK
dir_pair ={}
sdk_file = "./CUDASDK_bench.txt"
dirs = open(sdk_file,"r")
lines = dirs.readlines()
main_dir = ""
for line in lines:
    line = line.strip('\n')
    line = line.replace(' ', '')
    if(line[0].isdigit()):
        dir_pair[line]=[]
        main_dir=line
    else:
        dir_pair[main_dir].append(line)  
        
 # make all benchmarks using 'make'       
 with cd("Benchmark-Collection/CUDASDK"):
    #!ls
    for key in dir_pair:
        print('<<enter>> {}'.format(key))
        with cd('{}'.format(key)):
                for bench in dir_pair[key]:
                    with cd('{}'.format(bench)):
                        command= 'make clean'
                        print('\n' + command)
                        subprocess.call(command, shell=True)
                        command=('make')
                        print ('\n' + command)
                        subprocess.call(command, shell=True)
        print('<<leave>> {}'.format(key))