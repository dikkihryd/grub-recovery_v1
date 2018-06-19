#!/bin/bash
echo
echo
echo "=====Welcome to Grub Recovery After Install-DualBoot====="
echo "			By BaperOverFlow.com"
echo
echo
echo "Main Menu"
echo "1.Mounting and Install GRUB"
echo "2.Unmounting and Exit"
echo "Please select [1/2]"
echo

read char
case $char in
	1)
echo "check partition /(root) linux"  
echo
fdisk -l
echo
echo "Input your root partition to recover"
echo "Ex:/dev/sda1"
read partition
echo

echo "mounting.. $partition.."
mount $partition /mnt

echo "mounting.. /dev to /mnt/dev"
mount --bind /dev /mnt/dev

echo "mounting.. /dev/pts to /mnt/dev/pts"
mount --bind /dev/pts /mnt/dev/pts

echo "mounting.. /proc to /mnt/proc"
mount --bind /proc /mnt/proc

echo "mounting.. /sys to /mnt/sys"
mount --bind /sys /mnt/sys
echo
echo "=============================Mounting Succesfully========================="
echo "=========================================================================="
echo
echo
echo "chrooting.. /mnt.."
echo "chroot Succesfully"
egrep 'grub|bash' Grub-Recovery-v1.sh >Grub-install.sh
mv Grub-install.sh /mnt/bin
chmod +x /mnt/bin/Grup-install.sh
chroot /mnt

;;

2)
echo "unmounting.."

umount /mnt/sys
umount /mnt/proc
umount /mnt/dev/pts
umount /mnt/dev
umount /mnt
rm -rf /bin/Grub-install.sh
;;
3)
grub-install /dev/sda
update-grub

;;
esac



exit 0;

