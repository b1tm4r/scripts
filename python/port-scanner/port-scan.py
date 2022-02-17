#!/bin/python
#Import necessary modules
import sys
import socket
from datetime import datetime as date
#Define our target
if len(sys.argv) == 2:
	target = socket.gethostbyname(sys.argv[1]) #Translate hostname to ip
else:
	print("Invalid amount of arguments.")
	print("Syntax: python3 port-scan.py <ip>")
#Add a pretty banner
print("-" * 50)
print("Scanning target "+target)
print("Time started: "+str(date.now()))
print("-" * 50)
try: 
	for port in range(1,65535):
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		socket.setdefaulttimeout(3)
		result = s.connect_ex((target,port)) #Returns an error indicator
		if result == 0:
			print("Port {} is open".format(port))
		s.close()
except KeyboardInterrupt:
	print("\nExiting program.")
	sys.exit()
except socket.gaierror:
	print("Hostname could not be resolved.")
	sys.exit()
except socket.error:
	print("Couldn't connect to server.")
	sys.exit()
