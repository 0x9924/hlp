NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS=-g -O3


mul-vec-pot2.o:
	$(NASM) $(NASMFLAGS) mul-vec-pot2.asm -o mul-vec-pot2.o

main: mul-vec-pot2.o
	$(CC) $(CFLAGS) main.c mul-vec-pot2.o \
	-o main.out

clean:
	rm mul-vec-pot2.o main.out
