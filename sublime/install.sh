#!/bin/bash
#
# Setup of Sublime Text
# Note: sublime install is made with all other ones in `ubuntu/setup.sh`
#
DOTFILE_SUBLIME_CONFIG_PATH=$HOME"/.config/sublime-text-3/Packages/User"

if test ! $(which subl)
then
	echo "  Installing sublime for you"
	 sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update

	sudo apt-get -y install sublime-text-installer
fi



if [ ! -h "$DOTFILE_SUBLIME_CONFIG_PATH" ] && [ -f $DOTFILE_SUBLIME_CONFIG_PATH"/Package Control.last-run" ]
then
	echo "  Configuring sublime for you"
	rm -rf "$DOTFILE_SUBLIME_CONFIG_PATH"
	ln -s $DOTFILES/sublime/config "$DOTFILE_SUBLIME_CONFIG_PATH"
else
	echo "/!\ Sublime Text 3 not installed yet. Please install Package control first"
	echo "https://sublime.wbond.net/installation"
fi
