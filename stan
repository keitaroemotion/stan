#!/usr/bin/env python

import os
import sys

def get_size(f):
    return os.path.isfile(f) and os.path.getsize(f) or get_dir_size(f)    

def ishidden(f):
    f.startswith('.') 

def get_dir_size(file):
    return addup([get_size("%s/%s" % (file,f)) for f in listdir(file)])[0]

def addup(arg):
    return (len(arg) == 0) and [0] or [reduce(lambda x,y:x+y, arg)]
 
def listdir(d):
    try:
        return os.listdir(d)
    except:
        return [] 

def get_directory_input():
    return len(sys.argv) == 1 and "." or sys.argv[1] 

def puts(arg):
    print(arg)
    return arg

def b2gb(m, giga=0):
    billion = 1000000000 
    if (m > billion):
       giga = m/billion 
       rem  = m % billion
       mega = rem/1000000
       kilo = rem % 1000000
    else:
       mega = m/1000000
       kilo = m%1000000
    return "%sG %sM %sK" % (giga, mega, kilo) 

print b2gb(get_dir_size(get_directory_input()))
