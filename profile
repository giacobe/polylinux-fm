#!/bin/sh
umask 022
PS1='\W$ '
cd ~
clear
echo "********************************************************************************"
echo "*  Welcome to the File Manipulation Lab v5. Follow README.txt for each level.  *"
echo "*  When you think the task is complete, run validate to print your key.        *"
echo "*  To change to the next level, issue the command nextlevel.                   *"
echo "*  To change to the previous level, issue the command prevlevel.               *"
echo "********************************************************************************"
echo "* Level      : " $USER
cat README.txt
