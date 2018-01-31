NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS=-g -O3


extender-vector.o:
	$(NASM) $(NASMFLAGS) extender-vector.asm -o extender-vector.o

main: extender-vector.o
	$(CC) $(CFLAGS) main.c extender-vector.o \
	-o main.out

clean:
	rm extender-vector.o main.out
