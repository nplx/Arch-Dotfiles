#-----------------------------------------
# Name:       Yahoo Weather script
# Author:     Charles Gu
#-----------------------------------------
#!/usr/bin/env python

import urllib.request
from xml.dom.minidom import parseString

proxy_support = urllib.request.ProxyHandler({"http":"http://127.0.0.1:8087"})
opener = urllib.request.build_opener(proxy_support)
urllib.request.install_opener(opener)

file = urllib.request.urlopen("http://weather.yahooapis.com/forecastrss?w=2159908&u=c")
data = file.read()
file.close()
dom = parseString(data)

# Get current condition(cc)
def curCon(i):
	cc = dom.getElementsByTagName("yweather:condition")[0].getAttribute(i)
	return cc 
