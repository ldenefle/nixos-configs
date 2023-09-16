#!/bin/sh

flash()
{
    sudo dd conv=notrunc bs=512 seek=1    of=$1 if=./result/lib/sd_fuse-xu3/bl1.bin.hardkernel
    sudo dd conv=notrunc bs=512 seek=31   of=$1 if=./result/lib/sd_fuse-xu3/bl2.bin.hardkernel.1mb_uboot
    sudo dd conv=notrunc bs=512 seek=63   of=$1 if=./result/lib/sd_fuse-xu3/u-boot-dtb.bin
    sudo dd conv=notrunc bs=512 seek=2111 of=$1 if=./result/lib/sd_fuse-xu3/tzsw.bin.hardkernel
}

while true; do
    read -p "Do you wish to flash the Odroid image on device $1 ?" yn
    case $yn in
        [Yy]* ) flash $1; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


