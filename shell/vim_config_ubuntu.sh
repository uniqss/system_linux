#!/bin/bash

sudo apt-get install -y ctags

sudo apt-get install -y language-pack-zh-hans
sudo apt-get install -y fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming

sudo echo "LANG=\"zh_CN.UTF-8\"\nLANGUAGE=\"zh_CN:zh:en_US:en\"" /etc/environment


sudo mkdir -p /var/lib/locales/supported.d/
sudo echo "\nen_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8\nzh_CN.GBK GBK\nzh_CN GB2312\n" >> /var/lib/locales/supported.d/local

sudo locale

sudo locale-gen "en_US.UTF-8"

sudo dpkg-reconfigure locales


echo "now choose no!!!"
sleep 3s
sudo dpkg-reconfigure dash

