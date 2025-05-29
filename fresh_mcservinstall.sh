#!/usr/bin/env bash

if [[ $# == 0 ]]; then
	printf "You must enter a directory for the install.\nex: 'home/mcserv/install'\n\n"
	exit 0
fi

user_agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BEDROCK-UPDATER)"

# This gets the download url
url=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -s -L -A "$user_agent" https://minecraft.net/en-us/download/server/bedrock/ | grep -o 'https.*/bin-linux/.*.zip')

install_dir=$1
download_name="bedrock-server.zip"

# This downloads bedrock-server.zip
wget -U "$user_agent" $url -O "$install_dir/$download_name"

# Extract the install
unzip -o "$install_dir/$download_name" -d $install_dir

# Remove the zip
rm "$install_dir/$download_name"
