#!/bin/bash

# Author: g6c67
# Description: qemu/kvm vm creation script

name="vmname"
description=""
os_variant=""
diskpath="/media/vmhost/$name.qcow2"
size=""
isoloc="/home/$USER/shared/iso*.iso"

sudo virt-install \
   	--name $name --description $description \
	--os-type=linux --os-variant="debian11" \
	--ram=1024 \
	--vcpus=1 \
	--disk path=$diskpath,bus=virtio,size=$size \
	--network bridge=canal0 \
	--graphics vnc,listen=0.0.0.0,port=5901,password=password --noautoconsole \
	--cdrom $isoloc 
#	--extra-args 'console=ttyS0,115200n8 serial'
