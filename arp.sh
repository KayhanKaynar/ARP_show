#!/bin/bash
# Kayhan KAYNAR
# 2023.

is_alive_ping()
{
  ping -c 1 $1 > /dev/null
}

for i in 192.168.1.{1..254} 
do
is_alive_ping $i & disown
done

clear

output=$(arp -n)

printdefault(){
counter=1
output=$(arp -n)

IPlist=$(echo "$output" | grep ether | cut -d " " -f 1 - )

printf "###################################################\n"
printf "%-8s %-10s %-35s\n" "#" AGINIZDAKI CIHAZLAR
printf "###################################################\n\n"

for IP in $IPlist
do
        MAC=$(echo "$output" | grep ether | grep $IP | awk '{print $3}' )
                case $MAC in
                60:74:8d:c0:b7:e8 )
                        MAC="DIGITURK"
                        ;;
                * )
                        MAC="$MAC"
                        ;;
                esac
        printf "%-8s %-5s %-15s %-25s\n" $counter.cihaz : $IP $MAC
        let counter=counter+1
done
}

printdefault

exit 0
