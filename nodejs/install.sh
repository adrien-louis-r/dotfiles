#!/bin/bash

if test ! $(which node)
then
  echo "  Installing nodejs for you."
  sudo apt-get update
  sudo apt-get install -y python-software-properties python g++ make
  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get -y install nodejs
fi

npm config set registry http://registry.npmjs.eu/

if test ! $(which gulp)
then
  echo "  Installing gulp for you."
  sudo npm install -g gulp
fi

if test ! $(which webpack)
then
  echo "  Installing webpack for you."
  sudo npm install -g webpack
fi
