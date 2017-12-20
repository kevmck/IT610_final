#!/usr/bin/python

import os,sys

inp = os.popen("sudo repquota / | grep ubuntu").read()
inp = inp.split(" ")

inp = list(filter(lambda x: x!= '', inp))

current = int(inp[2])
softLimit = int(inp[3])
hardLimit = int(inp[4])

if current < softLimit:
    print "User quota OK - currently at " + str(current/hardLimit) + "% use"
    print("Use in blocks: current - " + str(current) + " soft limit - " + str(softLimit) + " hard limit - " + str(hardLimit))
    sys.exit(0)

elif current > softLimit:
    if current > softLimit and current < hardLimit:
	print "WARNING - quota currently at " + str(current/hardLimit) + "% use"
    	print("Use in blocks: current - " + str(current) + " soft limit - " + str(softLimit) + " hard limit - " + str(hardLimit))

    elif current >= hardLimit:
	print "CRITICAL - quota currently at " + str(current/hardLimit) + "% use"
	print("Use in blocks: current - " + str(current) + " soft limit - " + str(softLimit) + " hard limit - " + str(hardLimit))
	sys.exit(2)
else:
    print "UNKNOWN - check service"
    sys.exit(3)
