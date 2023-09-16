#!/usr/bin/env bash
###
### Create bootable grub USB Pen or generic disk
###
echo "Enter device (eg sde):"
read device
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkfs.vfat -F32 -s2 /dev/${device}
umount /media/USB || true
mkdir -p /media/USB
mount /dev/${device}1 /media/USB

grub-install -d ${SCRIPT_DIR}/EFI64/grub-core --force --removable --no-floppy --target=x86_64-efi --boot-directory=/media/USB/boot --efi-directory=/media/USB
grub-install -d ${SCRIPT_DIR}/EFI32/grub-core --force --removable --no-floppy --target=i386-efi --boot-directory=/media/USB/boot --efi-directory=/media/USB
grub-install -d ${SCRIPT_DIR}BIOS/grub-core --force --no-floppy --target=i386-pc --boot-directory=/media/USB/boot /dev/${device}
cp ${SCRIPT_DIR}/grub.cfg /media/USB/boot/grub/
cp ${SCRIPT_DIR}/initrd* /media/USB/
cp ${SCRIPT_DIR}/vmlinuz* /media/USB/



