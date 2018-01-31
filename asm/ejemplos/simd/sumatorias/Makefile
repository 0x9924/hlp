NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS= -g

RANDBYTES=~/hlp/c/ejemplos/rand/build/random-bytes.o

main: sumatorias
	$(CC) $(CFLAGS) $@.c build/sumatorias.o \
	$(RANDBYTES) -o build/$@.out


sumatorias:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

