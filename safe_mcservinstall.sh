#!/usr/bin/env bash

if [[ $# == 0 ]]; then
	printf "You need to enter the directory to the current server install\nex: 'home/mcserv/install'\n\n"
	exit 0
fi

install_dir=$1
backup_dir="$install_dir/backup"

mkdir $backup_dir

# Copy all important files from old install to a backup directory
cp "$install_dir/allowlist.json" "$install_dir/permissions.json" "$install_dir/server.properties" $backup_dir
cp -r "$install_dir/worlds" $backup_dir

# New install
bash fresh_mcservinstall.sh $install_dir

# Move back up files into install directory
cp "$backup_dir/allowlist.json" "$backup_dir/permissions.json" "$backup_dir/server.properties" $install_dir
cp -r "$backup_dir/worlds" $install_dir

# Remove the backup files
rm -r $backup_dir
