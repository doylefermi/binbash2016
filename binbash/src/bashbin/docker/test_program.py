import subprocess
import os
import signal
from bashmain import check_code

for i in xrange(2,3):
    dir = "/home/haxorware/bash_q/Level1/Question"+str(i)+"/"
    user_answer = dir+'answer.sh'
    extrafiles = [dir+'file.txt',dir+'.file2.txt',dir+'.file3.txt']
    testcases = [dir + 'testcase.txt',dir+'.testcase2.txt',dir+'.testcase3.txt']
    print dir
    print check_code(user_answer, extrafiles, testcases, "/tmp")
