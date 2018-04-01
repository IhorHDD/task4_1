#!/bin/bash
echo "---Hardware---">task4_1.out
cat /proc/cpuinfo | grep "model name"|sed 's/model name/CPU: /'>>task4_1.out

cat /proc/meminfo | grep "MemTotal:" | sed 's/MemTotal/RAM: /'>>task4_1.out

dmidecode baseboard-product-name | grep "Vendor:" | sed 's/Vendor/Motherboard: /'>>task4_1.out

dmidecode -s system-serial-number | sed 's/^/System Serial Number: /'>>task4_1.out
echo "---System---">>task4_1.out
cat /etc/os-release | grep "PRETTY_NAME" | sed 's/PRETTY_NAME=/OS Distribution: /'>>task4_1.out
uname -r | sed 's/^/Kernel version: /'>>task4_1.out
tune2fs -l /dev/sda1 | grep "Filesystem created:" | sed 's/Filesystem created/Installation date: /'>>task4_1.out
hostname -f | sed 's/^/Hostname: /'>>task4_1.out
uptime -p | sed 's/up/Uptime: /'>>task4_1.out
ps ax -l |wc -l | sed 's/^/Processes running: /'>>task4_1.out
who | wc -l | sed 's/^/Loged in users: /'>>task4_1.out
echo "---Network---">>task4_1.out
ifconfig | grep "inet addr">>task4_1.out

