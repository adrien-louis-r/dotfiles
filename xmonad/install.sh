if test ! $(which xmonad)
then
	echo "  Installing xmonad for you"
	sudo apt-add-repository ppa:synapse-core/testing
	sudo apt-get update

	sudo apt-get -y install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev synapse stalonetray cabal-install libghc-libxml-sax-dev c2hs libasound2-dev libiw-dev libgd2-xpm-dev

	cabal install xmobar --flags="all_extensions"
fi

