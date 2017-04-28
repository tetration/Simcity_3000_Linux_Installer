# Simcity-3000-_Linux_Installer
Simcity 3000 Unlimited Linux Installer Script made in python 2.x

# Simcity 3000/ Unlimited Linux Installer Python Script made by Tetration


# Github address: https://github.com/tetration


# Github repository: https://github.com/tetration/Simcity_3000_Linux_Installer


# Contact: Tetration@outlook.com
# Written for Python 2.X


# This script and the author of it is not responsible for any damages it might cause you including but not limited to: damaging your system, making your house burn, make you flunk at school or giving you stress. Use it at your own will and risk!

# Simcity 3000 Unlimited and Simcity 3000 Linux is a properity of EA, Maxis and Loki 
# Loki is a registered trademark of Loki Software, Inc.
# The author of this program doesnt claim any ownership of Simcity 3000 or Simcity 3000 Unlimited


Warning: In order to install Simciy 3000 (vanilla) or Unlimited you will need to have your legally purchased cdrom or legal backup iso of Simcity 3000/3000 unlimited Linux Edition. This program wont provide it or endorse piracy under any circumstances

Please be aware Simcity 3000 and Simcity 3000 Unlimited for Linux are complete distinct versions of the game. If you bought the Windows version you can only run the game on a Windows machine or on a Linux machine through Wine. My Python script can only help the people who have the Loki Games Linux Edition of this game.

# Instructions:

1: Move your Simcity 3000 or Simcity 3000 Unlimited iso in the same directory of this python script installer and then launch the python installer

2: To launch the python script you will have to start the linux terminal and then type cd (directory where this python script is located) example: cd /home/YourUsername/Desktop/PythonScriptFolder 

3:After that to launch it type in the terminal: python SCU3Installer.py

Enjoy the game!


Warning to make the SCU3installer launcher(sc3u_2.0a-multilingual_x86.mojo.run) that you just downloaded run with this script you might need to go to its properities and mark in its permissions "Allow executing file as program"




# Instructions if you want to do everything manually without my installer:

Warning: In order to install Simciy 3000 (vanilla) or Unlimited you will need the cdrom or the iso of one of them.
Download the installer:

https://www.liflg.org/?what=dl&catid=7&gameid=99&filename=sc3u_2.0a-multilingual_x86.mojo.run", "sc3u_2.0a-multilingual_x86.mojo.run


And then type the following commands in linux terminal

su 
mkdir /media/cdrom 
mount Simcty3000unlimited.iso /media/cdrom
./sc3u_2.0a-multilingual_x86.mojo.run


Warning to make installer run dont forget to go to its properities and mark in its permissions "Allow executing file as program"

In order to get sound in your game you will need to type the following commands
sudo apt-get update
sudo apt-get install osspd




Afterwards to get a custom resolution go to the folder in which the game is located and edit its resolution in the file snapshot.ini or run the game in windowed mode by whenever launch it hit alt+enter after it is launched to force windowed mode or execute it with -w option from terminal.

Also if the last part didnt work to get it running at the same resolution as your screen use the other executable in simcity3000 folder: sc3u.dynamic.sh

If anyone knows how to make the shortcut in desktop or the panel go fullscreen at the right computer´s resolution please tell me so.


# FAQ:
-Your python script fails to download the setup installer!

It seens like sometimes the installer fails to finish downloading the installer. Due to the slow internet speeds of the website that hosts the old loki games setup installers.

While we dont have a work around the best way to fix it is to download it manually(https://liflg.org/?catid=7) and then placing it in the same python folder of this script. Which will make the installation work.

- I´ve tried to install Simcity3000 on my linux machine using my Windows copy of Simcity 3000/3000 unlimited and your installer wont detect or accept them! Your software is broken!!!! Go fix it!!!!

As I stated above in the Readme of this python script github repository the installer will only be able to install and detect this game if its Simcity 3000 or Simcity 3000 Unlimited Linux Edition made by Loki Games. This Software isnt some kind of magic wizard that will be able to turn Simcity for windows into Simcity for linux. Please be aware that Sim City 3000 or Simcity 3000 Unlimited Linux Edition, made by Loki game is a complete distinct version of the Simcity 3000 or Simcity 3000 Unlimited made for Linux. If you want to use your windows version on a Linux machine please go use Wine.

I have the Linux Edition. Why would I need your installer than the original one that comes in the CD that I bough back in the day?

You need my installer because Linux changed a lot in the last 20 years and even if you are able to install it you will probably run it without a lot of issues such as the game not running correctly, audio missing and other glitches in modern Linux machines. My Installer makes sure to install it perfectly in modern Linux Machines and it also install packages needed to make the audio of the game work in the newest Linux Distributions.



Tested under: Linux Mint 17.3 Cinammon 64 bit, Deepin Linux 15.3 64 bit
