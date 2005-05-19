#!/bin/sh
#
#Installer for ob3 Menuizer
#
#Released under the GPL 15/05/2005 20:58:07

#--<color codes>----------------
PS_RED="\[\033[1;31m\]"     # Red
PS_GREEN="\[\033[1;32m\]"   # Green
PS_YELLOW="\[\033[1;33m\]"  # Yellow


#who am I?
if [ "$UID" = 0 ]; then
	./resource/echoc "You're root.  Good, we can continue." green
else 
   ./resource/echoc "You aren't root.  Only root can run this program!" red
	exit
fi

#Default install path.  Edit below to your liking if desired
BINPATH="${BINPATH:=/usr/local/bin}"
MYMANPATH="${MYMANPATH:=/usr/local/man/man1}"

# Check that directories exist.  
if [ -d "${BINPATH}" ]; then
	./resource/echoc "Binary directory path is good." green
else
	./resource/echoc "Can't find $BINPATH .  Install will exit." red
	exit
fi

if [ -d "${MYMANPATH}" ]; then
	./resource/echoc "Man directory path is good." green
else
	./resource/echoc "Can't find $MYMANPATH .  Install will exit." red
	exit
fi

cp ./resource/ob3_editor $BINPATH
cp ./resource/ob3_term $BINPATH
cp ./resource/openbox-autogen_menu $BINPATH

sleep 3

./resource/echoc "Program files successfully installed.  Installing documentation and man page." green

sleep 3

echo "ob3 Menuizer successfully installed.  Please see the documentation for usage."