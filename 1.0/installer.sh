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
LILOPATH="${LILOPATH:=/etc/lilo.conf}"
PORTAGEPATH="${PORTAGEPATH:=/etc/portage}"

# Check that directories exist.  
if [ -d "${BINPATH}" ]; then
	./resource/echoc "Binary directory path is good." green
else
	./resource/echoc "Can't find $BINPATH .  Install will exit. Please edit the install script with the correct bin path." red
	exit
fi

if [ -d "${MYMANPATH}" ]; then
	./resource/echoc "Man directory path is good." green
else
	./resource/echoc "Can't find $MYMANPATH .  Install will exit. Please edit the install script with the correct man page path." red
	exit
fi

# if all is good, copy the files
cp ./resource/ob3_editor $BINPATH
cp ./resource/ob3_term $BINPATH
cp ./resource/ob3_term_edit $BINPATH
cp ./resource/openbox-autogen_menu $BINPATH
cp ./resource/edit_fstab $BINPATH

#using lilo?
if [ -e "${LILOPATH}" ]; then
	cp ./resource/edit_lilo $BINPATH
fi

#using Gentoo?
if [ -d "${PORTAGEPATH}" ]; then
	cp ./resource/edit_make $BINPATH
	cp ./resource/edit_package.keywords $BINPATH
	cp ./resource/edit_package.use $BINPATH
fi

#ob3 icon 
if [ -d "$HOME/.config/openbox" ]; then
	cp ./resource/ob3.png $HOME/.config/openbox/
else
	mkdir $HOME/.config
	mkdir $HOME/.config/openbox
	cp ./resource/ob3.png $HOME/.config/openbox/
fi


./resource/echoc "Program files successfully installed.  Installing documentation and man pages." green

cp ./man/openbox-generate_menu.1 $MYMANPATH
cp ./man/ob3_editor.1 $MYMANPATH
cp ./man/ob3_term.1 $MYMANPATH

./resource/echoc "Man pages successfully installed.  Finishing installation."


echo "ob3 Menuizer successfully installed.  Please see the documentation for usage."
