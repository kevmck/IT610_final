#!/usr/bin/python

import os,sys

x = os.popen("ps -e -o pid,comm,etime | grep -m 1 \"\<smbd\>\"").read()

x = x[11:]
x = x.strip()
minutes = int(x[-5:-3])

if len(x) > 5:
    print "OK - smbd up for " + x
    sys.exit(0)

elif len(x) <= 5:
    if minutes < 5:
        print "CRITICAL - smbd up for " + x
        sys.exit(2)

    elif minutes > 5 and minutes < 10:
        print "WARNING - smbd up for " + x
        sys.exit(1)

    elif minutes > 10:
        print "Service OK - smbd up for " + x
        sys.exit(0)

else:
    print "UNKNOWN - check service"
    sys.exit(3)
