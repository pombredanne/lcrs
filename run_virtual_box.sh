#!/bin/sh

# For testing purposes....
#
# This script is used to add a virtual bridge interface (br0) and launch
# Virtual box. You need to configure Virtualbox to use a "host-only adapter"
# for the virtual machines. This should be called vboxnet0.
# Furthermore, you MUST disable Virtualbox's DHCP server!!

virtualbox&
echo "Waiting 10s for Virtualbox to configure network interface... standby..."
sleep 10s
sudo brctl addbr br0
sudo ifconfig br0 down
sudo ifconfig br0 10.20.20.1 255.255.255.0
#sudo ifconfig br0 up
sudo brctl addif br0 vboxnet0
