NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS= -g

RANDBYTES=~/hlp/c/ejemplos/rand/build/random-bytes.o

main: suma-mist
	$(CC) $(CFLAGS) $@.c build/suma-mist.o \
	$(RANDBYTES) -o build/$@.out


suma-mist:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

