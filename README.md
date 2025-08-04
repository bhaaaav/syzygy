# syzygy
a simple bootloader - x86

# Prerequisites 
1. This aoftware can be written and run in any linux distro
   >  sudo apt update
   
2. Installing Nasm Assembler for assembly code
   >  sudo apt install nasm && nasm -v
   
3. Installing Emulator Qemu
   this is chosen as it has incredible debug options for fututre os development
   
   the emulator will render a virtual machine but will be unable to do anything yet as no virtual hard disks are attached 

   >  sudo apt install qemu-system-x86 && qemu-system-x86_64
# boot.asm
This is the crux of the bootloader, temproarily just renders to qemu display 
>nasm -f bin ./boot.asm -o ./boot.bin
>
>ndisasm ./boot.bin

bin file created,and contents displayed. A bin file has no headers, its just the raw code outputed. Bin file is used because the process has no understanding of executables, file systems, file formats etc;
To emulate:
>qemu-system-x86_64 -hda ./boot.bin

# Writing boot sector into usb stick
> sudo fdisk -l

this lists all the disks running on the system, in my case the usb is /dev/sdc.
Make sure the usb doesnt contain data as it will be overwritten.

> sudo dd if=./boot.bin of=/dev/sdc

copy the bootloader to the usb stick using this cmd. this overwrites the first 512 bytes of out boot sector in usb. if-input file path, of-output file path 

save and load into uefi, and boot from usb stick youll see the current boot program running 

<mine hasnt worked yet so finding a workaround, will keep updating>
