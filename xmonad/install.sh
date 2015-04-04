if test ! $(which awesome)
then
	echo "  Installing xmonad for you"
	sudo apt-get -y install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar stalonetray
fi

if [ ! -h $HOME/.xmonad ]
then
	echo "  Configuring xmonad for you"
	ln -s $DOTFILES/xmonad/config $HOME/.xmonad
fi