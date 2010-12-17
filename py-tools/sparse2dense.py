#!/usr/local/bin/python2.0

import os, sys

from string import *

argv=sys.argv
argc=len(argv)

raw = map(split, open(argv[1]).readlines())

m=-1
data=[]
for line in raw:
    dline = [line[0]]
    begin=1
    for token in line[1:]:
        both=split(token, ":")
        next=atoi(both[0])
        if next>m:
            m=next
        for i in range(begin, next):
            dline.append("0")
        dline.append(both[1])
        begin=next+1
    data.append(dline)
    
for dline in data:
    for token in dline[1:]:
        print token,
    for i in range(len(dline), m+1):
        print 0,
    print dline[0]
    
    
