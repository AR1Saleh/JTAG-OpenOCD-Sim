all:
	riscv64-unknown-elf-gcc -g -O0 \
	-march=rv32imac -mabi=ilp32 \
	-nostdlib -nostartfiles \
	-T linker.ld \
	start.s main.c \
	-o main.elf
qemu: main.elf
	@echo "Ctrl-A C for QEMU console, then quit to exit"
	qemu-system-riscv32 -nographic -serial mon:stdio -machine virt -s -S -bios main.elf
gdb: main.elf
	@echo "Ctrl-A C for QEMU console, then quit to exit"
	gdb-multiarch main.elf -q -ex "set arch riscv:rv32" -ex "target remote localhost:1234" -ex "b _start" -ex "c" -ex "s"
clean:
	rm -f main.elf