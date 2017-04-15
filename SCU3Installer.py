#Simcity 3000/ Unlimited Linux Installer Script made by Tetration
#Github author address: https://github.com/tetration
#Github repository: tetration/Simcity_3000_Linux_Installer
#Contact: Tetration@outlook.com
#Written for Python 2.X

#Warning:
# This script and the author is not responsible for any damages
# it might cause you including but not limited to damaging your system, 
# making your house burn, making you flunk at school/college or
# giving you any kind of stress. 
# Use it at your own will and risk!

#Warning:
#In order to install Simciy 3000 (vanilla) or Unlimited you will need to have your legally purchased cdrom 
#or legal backup iso of Simcity 3000/3000 unlimited Linux Edition. 
#This program wont provide it or endorse piracy under any circumstances

#Simcity 3000 Unlimited and Simcity 3000 Linux is properity of EA, Maxis and Loki 
#Loki is a registered trademark of Loki Software, Inc.
# The author of this program doesnt claim any ownership of Simcity 3000/ Simcity 3000 Unlimited


import urllib
import os
import subprocess
import fnmatch

globalpath=""


def Check_ISO():
	print("Checking Iso...")
	for file in os.listdir('.'):
    		if fnmatch.fnmatch(file, '*.iso'):
    			s="";
    			seq=('SimCity 3000 Iso found! name of the file: ',file)
        		print(s.join(seq))
        		globalpath=file
        		mkdirandmount(file)

    		elif file==False:
    			print("ISO not found! Please move your Linux Scu3000 ISO file to this directory and then run this program again!")
    			exit()
    


def mkdirandmount(file):
	os.system("sudo mkdir /media/cdrom")
	s=("")
	seq=('sudo ','mount ', file,' /media/cdrom')
	print(s.join(seq))
	os.system("cd ./")
	os.system(s.join(seq))

def unmountISO_and_deletedir():
#Warning: Caution when trying to change this part of the program!
#Typing the wrong directory for it to the delete might break/damage your system!
# I recommend you to leave it the way it is
	s=("")
	seq=('sudo ','umount ', '/media/cdrom')
	print(s.join(seq))
	os.system("cd ./")
	os.system(s.join(seq))
	os.system("sudo rmdir /media/cdrom")


def Check_Download():#Checks if SCU3 loki installer is already downloaded if not it will start downloading it
	if os.path.isfile("sc3u_2.0a-multilingual_x86.mojo.run")==False:
		print("Downloading liflg installer...(Dont quit the program! wait until its over!)")
		urllib.urlretrieve ("https://www.liflg.org/?what=dl&catid=7&gameid=99&filename=sc3u_2.0a-multilingual_x86.mojo.run", "sc3u_2.0a-multilingual_x86.mojo.run")
		if urlretrieve==True:
			print("Download Finished!")
		else :
			print("Error: Couldnt finish downloading.")
			print("The program will exit now. Try again later by launching the program again!")
			exit()
	else : print("Installer already downloaded")
	globalpath=os.path.isfile("sc3u_2.0a-multilingual_x86.mojo.run")




def launch():
#If user didnt type sude when launching python script he will be asked in order to make the .run file launch itself successfully
	print("The program will need sudo permissions to launch the file /sc3u_2.0a-multilingual_x86.mojo.run")
	os.system("sudo chmod +x ./sc3u_2.0a-multilingual_x86.mojo.run")
	os.system("./sc3u_2.0a-multilingual_x86.mojo.run")

def installOSSPD():
	print("Simcity 3000 is an old game that relies on the OSSPD Audio Software")
	print("In order to have audio working in the game you will have to download it")
	print("Would you like for this script to download it for you? Type: yes or no")
	yn=raw_input()
	if yn=='yes':
		os.system("sudo apt-get update")
		os.system("sudo apt-get install osspd")

def Welcome():
	print("Welcome to SimCity3000 & Simcity 3000 Unlimited Installer for Linux ") 
	raw_input("Press Enter to continue...")

def main():#All the steps the program will do with its functions
	Welcome()
	Check_Download()
	Check_ISO()
	launch()
	unmountISO_and_deletedir()
	installOSSPD()
	print("Installation Complete")
	
# Initializer
main()
installer=os.system("echo enjoy the game!")
