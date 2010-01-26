#!/usr/local/bin/python2.0

import os, sys

from string import *

argv=sys.argv
argc=len(argv)

raw = map(split, open(argv[1]).readlines())

for line in raw:
    print line[-1],
    m=1
    for token in line[:-1]:
        if atof(token) != 0:
            print "%d:%s"%(m,token),
        m=m+1
    print
