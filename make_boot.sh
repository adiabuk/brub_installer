mkfs.vfat -F32 -s2 /dev/sdg1
mount /dev/sdg1 /media/USB
cd ~/grub
cd ./EFI64/grub-core
grub-install -d $PWD --force --removable --no-floppy --target=x86_64-efi --boot-directory=/media/USB/boot --efi-directory=/media/USB
cd ../../EFI32/grub-core
grub-install -d $PWD --force --removable --no-floppy --target=i386-efi --boot-directory=/media/USB/boot --efi-directory=/media/USB
cd ../../BIOS/grub-core
grub-install -d $PWD --force --no-floppy --target=i386-pc --boot-directory=/media/USB/boot /dev/sdg
cd /media/USB/boot/grub
cp ~/media/USB-copy/boot/grub/grub.cfg .
cd /media/USB
cp /USB-copy/initrd* .
cp /USB-copy/vmlinuz* .
#cp /USB-copy/System.map* .




