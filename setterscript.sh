#!/bin/bash

# Clearing the screen
clear
echo ""
echo " ########"
echo " ########"
echo " ########"
echo " ########"
echo ""

# Script that sets up software

dotPath=`pwd`

setbash() {
    # Bash config
    echo -e -n "\033[01;32mCopying bash configuration! \033[00m"
    cp -r $dotPath/bash/ ~/.bash/
    echo "source ~/.bash/colors" >> ~/.bashrc
    cat ~/.bash/ps1 >> ~/.bashrc
    echo "Done."
    if [ -f $dotPath/bash/bash_aliases ]; then
	cp -r $dotPath/bash/bash_aliases ~/.bash_aliases 
    fi

}

setemac() {
    # emac
    echo -e "Setting up emacs install."
    if [ -d "~/.emacs.d/" ]; then
	cp $dotPath/emacs/init.el ~/.emacs.d/init.el
	cp -r $dotPath/emacs/custom-plugins ~/.emacs.d/custom-plugins/
    else
	mkdir -p ~/.emacs.d/
	cp $dotPath/emacs/init.el ~/.emacs.d/init.el
	cp -r $dotPath/emacs/custom-plugins ~/.emacs.d/custom-plugins/
    fi
}

seti3() {
    echo "in development."
}

settmux() {
    # tmux config
    echo -e -n "\033[01;32m set tmux config file: \033[00m"
    cp $dotPath/tmux.conf ~/.tmux.conf 
    echo "Done."

}

setgdm3mon() {
    # Set up monitors on gnome greeter on correct configuration
    echo "Remember to first configure monitors."
    echo -e -n "\033[01;32m set tmux config file: \033[00m"
    cp ~/.config/monitors.xml /var/lib/gdm3/.config
    echo "Done."
}

setall() {
    # Set everything
    setbash
    setemac
    seti3
    settmux
    setgdm3mon
}

case $1 in
    bash)
	setbash
	;;
    emac)
	setemac
	;;
    i3)
	seti3
	;;
    tmux)
	settmux
	;;
    
    gdm3mon)
	setgdm3mon
	;;
    all)
	setall
	;;
    *)
	echo "choose a proper argument."
	echo ""
	echo "Usage: ./setterscript (argument)"
	echo ""
	echo "args:"
	echo "bash    : set up bash config"
	echo "emac    : set up emacs config"
	echo "i3      : set up i3 and rofi configuration"
	echo "        NOTE: In development"
	echo "tmux    : set up tmux config"
	echo "gdm3mon : set gdm3 monitor configuration"
	echo "        NOTES"
	echo "        - Requires root privileges"
	echo "        - Change configuration locally, then execute this part of the script"
	echo "all     : set up everything"
	;;
esac
