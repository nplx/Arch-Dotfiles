#-----------------------------------------
# Name:       Yahoo Weather script
# Author:     Charles Gu
# Created:    2012
# Copyright:  (c) Charles Gu 2012
# License:    GPL Version 3
#-----------------------------------------
#!/usr/bin/python

import urllib.request
from xml.dom.minidom import parseString

page = urllib.request.urlopen("http://weather.yahooapis.com/forecastrss?w=2159908&u=c")
data = page.read()
page.close()
dom = parseString(data)

# Current
currentCondition = ["temp","text"]
for attr in currentCondition:
        yw = dom.getElementsByTagName("yweather:condition")[0].getAttribute(attr)
        print (yw)
