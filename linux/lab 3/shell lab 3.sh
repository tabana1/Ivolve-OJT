#!/bin/bash


NETWORK="192.168.153.132"

# Loop through the range of IP addresses
for i in {1..254}
do
  IP="$NETWORK.$i"
  # Ping the IP address with a timeout of 1 second and send only one packet
  if ping -c 1 -W 1 $IP > /dev/null; then
    echo "Server $IP is up and running"
  else
    echo "Server $IP is unreachable"
  fi
done
