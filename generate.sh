#!/bin/sh
cd `dirname $0`

rm -f ./gfwlist.pac
#wget https://raw.githubusercontent.com/petronny/gfwlist2pac/master/gfwlist.pac
#use jsdelivr CDN
wget https://cdn.jsdelivr.net/gh/petronny/gfwlist2pac/gfwlist.pac
sed -i 's|127.0.0.1:1080|127.0.0.1:1088|g' gfwlist.pac

#simple add needed domain
sed -i '/"google.com",/a\            "drweb.com",' gfwlist.pac
sed -i '/"google.com",/a\            "kaspersky-labs.com",' gfwlist.pac
sed -i '/"google.com",/a\            "asciinema.org",' gfwlist.pac
sed -i '/"google.com",/a\            "sourceforge.io",' gfwlist.pac
sed -i '/"google.com",/a\            "sourceforge.net",' gfwlist.pac
sed -i '/"google.com",/a\            "gamepedia.com",' gfwlist.pac
sed -i '/"google.com",/a\            "cursecdn.com",' gfwlist.pac




git add .
git commit -m "[$(LANG=C date)] update"
git push origin master
