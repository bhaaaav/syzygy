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
>ndisasm ./boot.bin

bin file created, to contents displayed. A bin file has no headers, its just the raw code outputed. The process has no understanding of executables, file systems, file formats etc;
To emulate:
>qemu-system-x86_64 -hda ./boot.bin
