NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS=-g -O3


filtrar-mayores.o:
	$(NASM) $(NASMFLAGS) filtrar-mayores.asm -o filtrar-mayores.o

main: filtrar-mayores.o
	$(CC) $(CFLAGS) main.c filtrar-mayores.o \
	-o main.out

clean:
	rm filtrar-mayores.o main.out
