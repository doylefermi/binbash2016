#!/bin/bash

cat $1 | sed y/abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcba/

