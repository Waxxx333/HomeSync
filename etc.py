#! /usr/bin/python2
import os 
import subprocess
import sys
from time import sleep
import time
WHITE="\033[38;5;7m"
try:
	devon = raw_input(WHITE+"DEVICE ONE's PATH ")
	DEVONE = 'DEVONE="%s"'%(devon)
	os.system("sed -i '5i%s' homesync"%DEVONE)
	print "To homesync to Device One, you'll use the flag -o{sudo homesync -o}"
except:
	print "Device one's path isn't entered in the script [!]"
try:
	devtw = raw_input("DEVICE TWO's PATH ")
	DEVTWO = 'DEVTWO="%s"'%(devtw)
	os.system("sed -i '6i%s' homesync"%DEVTWO)
	print "To homesync to Device Two, you'll use the flag -o{sudo homesync -t}"
except:
	print "Device two hasn't been entered [!]"
rmhomesync = subprocess.check_output("if [ -f /usr/bin/homesync ]; then sudo rm /usr/bin/homesync;fi", shell=True)
mvhomesync = subprocess.check_output("sudo cp -f homesync /usr/bin/homesync", shell=True)
import sys 
from time import sleep
def load(n=10):

	for i in range(n):
		print '\b.',
		sys.stdout.flush()
		sleep(.2)
print 'loading homesync',
load()
run = subprocess.check_output("/usr/bin/homesync", shell=True)