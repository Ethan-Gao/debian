#!/bin/sh

ROOTFS_DIR=
# check root
if [ `whoami` != "root" ]
then
        echo "run as root or with sudo ..."
        exit
fi

# set necessary environment
sudo apt-get install qemu-user-static
sudo cp /usr/bin/qemu-arm-static $ROOTFS_DIR/usr/bin/
sudo cp /etc/resolv.conf $ROOTFS_DIR/etc
echo "###kernel of host shouldn't be too old###"
sudo chroot $ROOTFS_DIR
