#! /usr/bin/zsh
cd storage/app/Vegifruit/
echo latest database backup is `ls -tr | grep zip | tail -n 1`
unzip `ls -tr | grep zip | tail -n 1`
mysql -u root -p vegifruit < db-dumps/mysql-vegifruit.sql
echo Database restored.
