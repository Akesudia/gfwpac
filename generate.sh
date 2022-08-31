#!/bin/sh
cd `dirname $0`

rm -f ./*.pac
#wget https://raw.githubusercontent.com/petronny/gfwlist2pac/master/gfwlist.pac
#use jsdelivr CDN
wget https://cdn.jsdelivr.net/gh/petronny/gfwlist2pac/gfwlist.pac

#simple add needed domain
sed -i '/"google.com",/a\            "drweb.com",' gfwlist.pac
sed -i '/"google.com",/a\            "kaspersky-labs.com",' gfwlist.pac
sed -i '/"google.com",/a\            "asciinema.org",' gfwlist.pac
sed -i '/"google.com",/a\            "sourceforge.io",' gfwlist.pac
sed -i '/"google.com",/a\            "sourceforge.net",' gfwlist.pac
sed -i '/"google.com",/a\            "gamepedia.com",' gfwlist.pac
sed -i '/"google.com",/a\            "cursecdn.com",' gfwlist.pac
sed -i '/"google.com",/a\            "ping.pe",' gfwlist.pac
sed -i '/"google.com",/a\            "kisssub.org",' gfwlist.pac
sed -i '/"google.com",/a\            "wallhaven.cc",' gfwlist.pac
sed -i '/iqiyi.com/d' gfwlist.pac

#just what i need
cp gfwlist.pac ss.pac
cp gfwlist.pac clash.pac
rm gfwlist.pac
sed -i 's|127.0.0.1:1080|127.0.0.1:1088|g' ss.pac
cp ss.pac ncb.pac
sed -i 's|127.0.0.1:1080|127.0.0.1:7890|g' clash.pac
sed -i '/var proxy = '\''SOCKS5 127.0.0.1:1080'\'';/a\var lproxy = '\''SOCKS5 127.0.0.1:1089'\'';' ncb.pac
sed -i 's|'\''DIRECT'\''|lproxy|g' ncb.pac


git add .
git commit -m "[$(LANG=C date)] update"
git push origin master
