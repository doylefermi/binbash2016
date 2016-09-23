#!/bin/bash
grep -o "[aeiouAEIOU]\{2\}.\{0,1\}" $1 | grep -o '.$' | tr '\n' '\0'
