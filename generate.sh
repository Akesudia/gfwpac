#!/bin/sh
cd `dirname $0`

wget https://raw.githubusercontent.com/petronny/gfwlist2pac/master/gfwlist.pac
sed -i 's|127.0.0.1:1080|127.0.0.1:1088|g' gfwlist.pac

git add .
git commit -m "[$(LANG=C date)] update"
git push origin master
