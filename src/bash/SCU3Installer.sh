#!/bin/bash
#Simcity 3000/ Unlimited Linux Installer Script made by Tetration
#Github author address: https://github.com/tetration
#Github repository: tetration/Simcity_3000_Linux_Installer
#Contact: Tetration@outlook.com
#Originally written for Python 2.X
#Rewritten for BASH by Mouse https://github.com/techmouse
 
#Warning:
# This script and the author(s) are not responsible for any damages
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
# The author(s) of this program don't claim any ownership of Simcity 3000/ Simcity 3000 Unlimited
 
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${CURRENT_DIR}"
 
shouldcontinue=1
if [[ $(which unzip) == "" ]]; then
    echo "unzip doesn't appear to be installed and is required for this script."
    shouldcontinue=0
fi
if [[ $(which wget) == "" ]]; then
    echo "wget doesn't appear to be installed and is required for this script."
    shouldcontinue=0
fi
if [[ $(which gio) == "" ]]; then
    echo "gio doesn't appear to be installed and is required for this script (because rm is dangerous)."
    shouldcontinue=0
fi
 
check_iso(){
    echo "Checking Iso..."
    asdf=0
    for f in ./*.iso; do
        if [[ $asdf == 0 ]]; then
            isofile="$(basename "$f")"
            echo "Possible SimCity 3000 Iso found! name of the file: $isofile"
            asdf=1
        else
            echo "Multiple ISO files found. Please ensure there is only one ISO file in your SimCity 3000 directory and run this program again."
            echo "Exiting."
            exit
        fi
    done
    if [[ $asdf == 0 ]]; then
        echo "ISO not found! Please move your Linux Scu3000 ISO file to this directory and then run this script again!"
        exit
    else
        mkdirandmount
    fi
}
 
mkdirandmount(){
    echo "Root permissions are required to mount the ISO."
    echo "If you're not comfortable giving this script root permissions, you may perform this step yourself and the script will wait."
    echo "Would you like to give this script root permissions?"
    echo "[ yes / no ]"
    read asdf
    if [[ "$asdf" == "y"* ]] || [[ "$asdf" == "Y"* ]]; then
        #/media/cdrom is usually already present. Failing that, it will be at /mnt/cdrom instead. But there's no harm in doing this.
        sudo mkdir -p /media/cdrom
        sudo mount "$(realpath "$isofile")" /media/cdrom
        if ! [[ $? == 0 ]]; then
            echo "An error has occurred while mounting the ISO and this script isn't programmed to handle it."
            echo "Exiting."
            exit
        fi
    else
        echo "Then you will need to run these commands from a separate terminal:"
        echo "sudo mkdir -p /media/cdrom"
        echo "sudo mount \"$(realpath $isofile)\" /media/cdrom"
        echo "Press enter when you are ready to continue."
        read asdf
    fi
}
 
unmount_iso(){
    #It is very ill-advised to delete /media/cdrom, as this is a standard directory and was likely already there when this script ran. Even if it didn't exist before, there is no harm in leaving it where it is.
    #So we will only unmount the file.
    echo "Root permissions are required to unmount the ISO."
    echo "If you're not comfortable giving this script root permissions, you may perform this step yourself and the script will wait."
    echo "Would you like to give this script root permissions?"
    echo "[ yes / no ]"
    read asdf
    if [[ "$asdf" == "y"* ]] || [[ "$asdf" == "Y"* ]]; then
        sudo umount /media/cdrom
        if ! [[ $? == 0 ]]; then
            echo "An error has occurred while unmounting the ISO and this script isn't programmed to handle it."
            echo "It likely won't hurt anything so the script will continue, but you'll still have to manually unmount it yourself if it gives you problems."
        fi
    else
        echo "Then you will need to run this command from a separate terminal:"
        echo "sudo umount /media/cdrom"
        echo "Press enter when you are ready to continue."
        read asdf
    fi
}
 
check_download(){
    if ! [[ -f "./sc3u_2.0a-multilingual_x86.mojo.run" ]]; then
        echo "Downloading liflg installer...(Dont quit the program! wait until its over!)"
        wget "https://drive.google.com/uc?export=download&id=11YoyJH2oSW74i-AonejJ59It8NJIaf1h" -O "./SCU3Installer_patch.zip"
        if [[ $? == 0 ]]; then
            echo "Download finished!"
            extract_and_delete_zip
        else
            echo "Error: Couldnt finish downloading."
            echo "The program will exit now. Try again later by launching the program again!"
            exit
        fi
    else
        echo "Installer already downloaded"
    fi
}
 
extract_and_delete_zip(){
    echo "Extracting files..."
    unzip -d ./ "./SCU3Installer_patch.zip"
    echo "Extraction complete!"
    echo "Deleting zipfile..."
    gio trash "./SCU3Installer_patch.zip"
}
 
launch(){
    #root permissions are NOT required to assign an executable flag to a file and run a program
    chmod +x "./sc3u_2.0a-multilingual_x86.mojo.run"
    "./sc3u_2.0a-multilingual_x86.mojo.run"
}
 
installossspd(){
    if [[ $(which osspd) == "" ]]; then
        echo "Simcity 3000 is an old game that relies on the OSSPD Audio Software"
        echo "In order to have audio working in the game you will have to download it"
        echo "Root permissions are required for this step."
        echo "If you're not comfortable giving this script root permissions, you may perform this step yourself and the script will wait."
        echo "Would you like to give this script root permissions?"
        echo "[ yes / no ]"
        read asdf
        if [[ "$asdf" == "y"* ]] || [[ "$asdf" == "Y"* ]]; then
            sudo apt-get update
            sudo apt-get install osspd
            if ! [[ $? == 0 ]]; then
                echo "An error has occurred while installing osspd and this script isn't programmed to handle it. You will have to manually sort this out yourself."
            fi
        else
            echo "Then you will need to run these commands from a separate terminal:"
            echo "sudo apt-get update"
            echo "sudo apt-get install osspd"
            echo "Press enter when you are ready to continue."
            read asdf
        fi
    else
        echo "OSSPD is already installed. Skipping."
    fi
}
 
hello(){
    echo "Welcome to SimCity3000 & Simcity 3000 Unlimited Installer for Linux "
    echo "Press enter to continue..."
    read asdf
}
 
goodbye(){
    echo "Installation Complete"
    echo "Enjoy the game!"
}
 
if [[ "$shouldcontinue" == 1 ]]; then
    hello
    check_download
    check_iso
    launch
    unmount_iso
    installossspd
    goodbye
else
    echo "Exiting."
fi