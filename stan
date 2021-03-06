#!/usr/bin/env python

import os
import sys

def get_size(f):
    return os.path.isfile(f) and os.path.getsize(f) or get_dir_size(f)    

def ishidden(f):
    f.startswith('.') 

def get_dir_size(file):
    return addup([get_size("%s/%s" % (file,f)) for f in listdir(file)])[0]

def get_dir_size_ini(file):
    return [fit(f, get_dir_size("%s/%s" % (file,f))) for f in listdir(file)]

def puts(x):
    if x != '':
        print(x)
    return x

def color(x):
    return "\033[92m"+x

def fit(x, f):
    return f > 1000 and "|%s\033[0m| %s" % (color(x), b2gb(f)) or ''

def addup(arg):
    return (len(arg) == 0) and [0] or [reduce(lambda x,y:x+y, arg)]
 
def listdir(d):
    try:
        return os.listdir(d)
    except:
        return [] 

def get_directory_input():
    return len(sys.argv) == 1 and "." or sys.argv[1] 

def getValue(x, denom, box=()):
    return denom > 999 and getValue(x%denom,denom/1000, box+(x/denom,)) or box+(x,)

def unitmap(key):
    return {
       1000000000:"GB",
       1000000   :"MB",
       1000      :"KB"     
    }[key]

def b2gb(m):
    return (lambda t: "%sG %sM %sK" % (t[0], t[1], t[2]))(getValue(m/8, 1000000000))

#print b2gb(get_dir_size(get_directory_input()))
[puts(x) for x in get_dir_size_ini(get_directory_input())]
