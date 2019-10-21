# ThanOS
My attempt at creating a functional Operating System using online resources

To run the ThanOS, you need to install and use QEMU as an OS emulator

Once installed, cd to the location of the OS files and run 'qemu-system-x86_64 os-image.bin'

It is possible to change the boot text by editing and recompiling the 'boot-sector.asm' file using NASM as 'nasm -f bin boot-sector.asm'

This project is still unfinished and currently a WIP
