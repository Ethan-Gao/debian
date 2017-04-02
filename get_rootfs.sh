#!/bin/sh

# check root
if [ `whoami` != "root" ]
then
	echo "run as root or with sudo ..."
	exit
fi

#set enviroment
sudo apt-get install qemu-user-static debootstrap binfmt-support
#download source : xxx-wheezy,jessise,squeeze... yyy-armel,armhf,arm64...
targetdir=rootfs
distro=xxx
mkdir $targetdir
sudo debootstrap --no-check-gpg --arch=yyy --foreign $distro $targetdir
