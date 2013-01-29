##-------------------------------------------------------
## Name:       WeatherUnderground Current Weather Script
## Author:     Charles Gu
##-------------------------------------------------------
#!/usr/bin/python3

import urllib.request
from xml.dom.minidom import parse

## If you want to use proxy, uncomment these three lines.
proxy_support = urllib.request.ProxyHandler({"http":"http://127.0.0.1:8087"})
opener = urllib.request.build_opener(proxy_support)
urllib.request.install_opener(opener)

##--------------------------------------------------------------------------------------------
dataDump = urllib.request.urlopen("http://rss.wunderground.com/auto/rss_full/global/stations/54527.xml?units=metric") ## Change the number to your location's WU code; Units can be either metric or english.
xml = parse(dataDump)

chan = xml.getElementsByTagName("channel")[0]

def curc():
	de = chan.getElementsByTagName("description")[1].firstChild.data
	li = de.split("| ")
	li[0] = li[0].split("&")[0]
	li[5] = li[5].split("<")[0]
	for i in li:
		x = i.split(": ")[0]
		y = i.split(": ")[1]
		print(x,":",y)

def forc():
	for i in range(2,8):
		ti = chan.getElementsByTagName("title")[i+1].firstChild.data
		da = ti.split("for ")[1]
		da = da.split(" as")[0]
		de = chan.getElementsByTagName("description")[i].firstChild.data
		co = de.split(". ")[0]
		co = co.lstrip()
		te = de.split(". ")[1]
		te = te.split(" &")[0]
		print(da,co,te)

if __name__ == "__main__":
	curc()
	forc()
