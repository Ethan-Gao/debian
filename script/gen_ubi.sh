#!/bin/sh

#ref : http://blog.csdn.net/wanghelou123/article/details/45891995

# check root
if [ `whoami` != "root" ]
then
        echo "run as root or with sudo ..."
        exit
fi

# make ubi
if [ $1 == "creat" ]
then
	#creat ubinize.cfg
	echo "
	[ubifs]
	mode=ubi
	image=rootfs.ubifs
	vol_id=0
	vol_size=100MiB
	vol_type=dynamic
	vol_name=rootfs
	vol_flags=autoresize
	" > ubinize.cfg
	#creat ubi.img
	sudo mkfs.ubifs -r rootfs -m 2048 -e 126976 -c 4063 -o rootfs.ubifs
	sudo ubinize -o rootfs.img -m 2048 -p 128KiB -s 512 -O 2048 ubinize.cfg
elif [ $1 == "remove" ]
then
	rm -rf rootfs.ubifs rootfs.img ubinize.cfg
fi
