# syzygy
a simple bootloader - x86

# Prerequisites 
1. This aoftware can be written and run in any linux distro
   >  sudo apt update
   
2. Installing Nasm Assembler for assembly code
   >  sudo apt install nasm && nasm -v
   
3. Installing Emulator Qemu
   this is chosen as it has incredible debug options for fututre os development
   >  sudo apt install qemu-system-x86 && qemu-system-x86_64
   the emulator will render a virtual machine but will be unable to do anything yet as no virtual hard disks are attached 
