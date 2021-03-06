!/bin/bash
if pgrep -x "ntpd" > /dev/null
then 
echo "Running"
else 
echo "Stopped"
service ntp start
fi

File=/etc/ntp.conf

if grep -q ua.pool.ntp.org "$File" 
then 
echo "it's found"
else 
echo "it's not found"
cp /etc/ntp.conf  /home/ihor/scripts/stdout.out
echo "hould only have to update the server line below
#  - if you start getting lines like 'restrict' and 'fudge'
#    and you didnt add them, AND you run dhcpcd on your
#    network interfaces, be sure to add '-Y -N' to the
#    dhcpcd_ethX variables in /etc/conf.d/net

# Name of the servers ntpd should sync with
# Please respect the access policy as stated by the responsible person.

server          ua.pool.ntp.org                iburst
server          1.ubuntu.pool.ntp.org               iburst
server          2.ubuntu.pool.ntp.org               iburst
server          3.ubuntu.pool.ntp.org               iburst

##
# A list of available servers can be found here:
# http://www.pool.ntp.org/
# http://www.pool.ntp.org/#use
# A good way to get servers for your machine is:
# netselect -s 3 pool.ntp.org
##

# you should not need to modify the following paths
driftfile       /var/lib/ntp/ntp.drift
logfile         /var/log/ntp.log

server 127.127.1.0
fudge 127.127.1.0 stratum 10
#server ntplocal.example.com prefer 
#server timeserver.example.org 

# Warning: Using default NTP settings will leave your NTP
# server accessible to all hosts on the Internet.

# If you want to deny all machines (including your own)
# from accessing the NTP server, uncomment:
#restrict default ignore


# To deny other machines from changing the
# configuration but allow localhost:
restrict default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict 1.2.3.4 nomodify
restrict 192.168.0.0 mask 255.255.255.0 nomodify notrap


" > /etc/ntp.conf
fi
