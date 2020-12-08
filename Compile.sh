# nasm -f elf32 Program.s -o prog.o

nasm -f elf32 Loader.s -o Loader.o
gcc -c Kernel.c -m32 -nostdlib -nostdinc -ffixed-ecx -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -W
ld -T Link.ld -melf_i386 Loader.o Kernel.o  -o ./iso/boot/kernel
# ld -melf_i386 prog.o
# objcopy -O binary --only-section=.text a.out iso/modules/crash Unsupported on repl.it
#grub-mkrescue iso -o os.iso
qemu-system-x86_64 -kernel ./iso/boot/kernel