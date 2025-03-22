#!/bin/bash
apt-get update && apt-get install -y wget unzip curl
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y
ln -s /usr/bin/google-chrome-stable /usr/bin/google-chrome