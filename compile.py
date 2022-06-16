#!/usr/bin/python3
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

        
# bench_dir is the main dir of benchmark like Rodinia/  CUDASDK/
# the function will do the following things according to the params:
#  1. cd bench_dir
#  2. make clean
#  3. cd sec_bench_dir
#  4. for bench in sec_bench_dir: 
#         cd bench ; make
# for example , the dir structure of CUDA SDK is :
#  CUDASDK
#     |-----0_Simple
#             |--------aysncAPI/
#             |--------...
# so   sec_bench_dir is 0_Simple/ here , this can be read from the bench file
# make_benchmarks("./CUDASDK_bench.txt","Benchmark-Collection/CUDASDK","CUDA SDK")
def make_benchmarks(bench_file,bench_dir,bench_name):    
    # ====================CUDA SDK====================
    done_num = 1
    tot_num =0
    dir_pair ={}
    sdk_file = bench_file
    dirs = open(sdk_file,"r")
    lines = dirs.readlines()
    main_dir = ""
    for line in lines:
        line = line.strip('\n')
        line = line.replace(' ', '')
        # cuda sdk dir structure
        if(line[0].isdigit()):
            #if main_dir in dir_pair:
                #del dir_pair[main_dir]
                
            # for Rodinia 
            if line == '0_cuda_rodinia':
                line='cuda'
                
            dir_pair[line]=[]
            main_dir=line
        else:
            dir_pair[main_dir].append(line)  
            tot_num = tot_num+1

     # make all benchmarks using 'make'       
    with cd(bench_dir):
        # !pwd
        command= 'make clean'
        print('\n' + command)
        subprocess.call(command, shell=True)
        
        for key in dir_pair:
            print('<<enter>> {}'.format(key))
            with cd('{}'.format(key)):
                    for bench in dir_pair[key]:
                        with cd('{}'.format(bench)):
                            #command= 'make clean'
                            #print('\n' + command)
                            #subprocess.call(command, shell=True)
                            print('['+str(done_num)+'/'+str(tot_num)+']')
                            command=('make')
                            print (command)
                            subprocess.call(command, shell=True)
                            done_num = done_num + 1
            print('<<leave>> {}'.format(key))
    #============================================================
    print(bench_name+" Done")
    

if __name__ == "__main__":
    make_benchmarks("./CUDASDK_bench.txt","Benchmark-Collection/CUDASDK","CUDA SDK")
    make_benchmarks("./Rodinia_bench.txt","Benchmark-Collection/Rodinia/","Rodinia")