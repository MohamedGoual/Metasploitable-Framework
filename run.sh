#!/bin/bash

clear
echo -e "\e[32m"
echo "======================================================="
echo "           Installing Metasploit on Termux            "
echo "======================================================="
echo -e "\e[0m"

pkg update -y && pkg upgrade -y
pkg install -y wget git curl ruby python3 clang libpcap-dev libxml2 libxslt-dev postgresql postgresql-dev termux-tools make gawk zip unzip

git clone https://github.com/rapid7/metasploit-framework.git /data/data/com.termux/files/home/metasploit-framework

cd /data/data/com.termux/files/home/metasploit-framework
gem install bundler
bundle install

pg_ctl start -D $PREFIX/var/lib/postgresql
createuser msfuser -P
createdb msfdb -O msfuser

ln -sf /data/data/com.termux/files/home/metasploit-framework/msfconsole $PREFIX/bin/msfconsole
ln -sf /data/data/com.termux/files/home/metasploit-framework/msfvenom $PREFIX/bin/msfvenom

chmod +x /data/data/com.termux/files/home/metasploit-framework/msfconsole

echo -e "\e[32m"
echo "Metasploit Framework (msfconsole) has been successfully installed!"
echo -e "\e[0m"
echo "You can start Metasploit by running 'msfconsole' command."
