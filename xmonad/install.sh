if test ! $(which xmonad)
then
	echo "  Installing xmonad for you"
	sudo apt-add-repository ppa:synapse-core/testing
	sudo apt-get update

	sudo apt-get -y install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev xmobar synapse stalonetray
fi

