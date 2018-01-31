NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS= -g

RANDBYTES=~/hlp/c/ejemplos/rand/build/random-bytes.o

main: suma-positivos
	$(CC) $(CFLAGS) $@.c build/suma-positivos.o \
	$(RANDBYTES) -o build/$@.out


suma-positivos:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o
