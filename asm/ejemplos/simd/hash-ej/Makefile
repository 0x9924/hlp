NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS= -g

RANDBYTES=~/hlp/c/ejemplos/rand/build/random-bytes.o

main: cmp--1 triple hashear
	$(CC) $(CFLAGS) $@.c build/cmp--1.o \
	build/triple.o \
	build/hashear.o \
	$(RANDBYTES) -o build/$@.out


cmp--1:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

triple:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

hashear:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o
