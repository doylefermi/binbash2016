#!/bin/bash
grep -o "[A-Z]" $1 | tr -d '\n'

