import subprocess
import os
import signal
from bashmain import check_code

for i in xrange(5,6):
    dir = "/home/ec2-user/binbash2016/binbash/src/bashbin/Bash/Level2/Question"+str(i)+"/"
    user_answer = dir+'answer.sh'
    extrafiles = [dir+'file.txt',dir+'.file2.txt',dir+'.file3.txt']
    testcases = [dir + 'testcase.txt',dir+'.testcase2.txt',dir+'.testcase3.txt']
    print check_code(user_answer, extrafiles, testcases, "/tmp")
