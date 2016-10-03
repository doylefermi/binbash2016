#!/bin/bash
a=${1::-1}
a=$a"1"
curl -s -L -o calllog $a  
unzip -qq -p calllog 2>/dev/null

