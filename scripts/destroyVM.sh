#!/bin/bash

# simple script that destroys qemu/kvm vm and erases it's contents
echo "Name of the VM"
read name
sudo virsh destroy $name && sudo virsh undefine $name
