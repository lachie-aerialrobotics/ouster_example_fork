#!/usr/bin/env bash

ETH_NAME="eth0"

ip addr flush dev $ETH_NAME
sudo ip addr add 10.5.5.1/24 dev $ETH_NAME

read -n 1 -s -r -p "Please power on the lidar and press any key to continue..."

sudo ip link set $ETH_NAME up

sudo dnsmasq -C /dev/null -kd -F 10.5.5.50,10.5.5.100 -i $ETH_NAME --bind-dynamic