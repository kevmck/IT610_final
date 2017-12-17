#!/usr/bin/python

import sys
from linux_metrics import net_stat

warning = (float(sys.argv[1]) * 1.0)
critical = (float(sys.argv[2]) * 1.0)

if warning > critical:
    print "-w cannot be larger than -c"
    sys.exit(3)
    
if warning == critical:
    print "-w cannot be larger than -c"
    sys.exit(3)    

stats = (net_stat.rx_tx_bytes("eth0"))
inOcts = stats[0]
outOcts = stats[1]

inOctsGB = float("{0:.3f}".format(inOcts / (1073741824 * 1.0)))
outOctsGB = float("{0:.3f}".format(outOcts / (1073741824 * 1.0)))

if inOctsGB < warning:
    print "OK - inOcts " + str(inOctsGB) + "GB; outOcts " + str(outOctsGB) + "GB"
    sys.exit(0)

elif inOctsGB > warning and inOctsGB < critical:
    print "WARNING - inOcts " + str(inOctsGB) + "GB; outOcts " + str(outOctsGB) + "GB"
    sys.exit(1)
        
elif inOctsGB > critical:
    print "CRITICAL - inOcts " + str(inOctsGB) + "GB; outOcts " + str(outOctsGB) + "GB"
    sys.exit(2)
            
else:
    print "UNKNOWN - check service"
    sys.exit(3)