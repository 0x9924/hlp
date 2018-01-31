NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS=-g

main: leer-pila
	$(CC) $(CFLAGS) $@.c -o build/main.out build/leer-pila.o

leer-pila:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o


all: uso-vars-locales
vars-locales.o:
	$(NASM) $(NASMFLAGS) variables-locales.asm -o variables-locales.o

uso-vars-locales: vars-locales.o
	$(CC) $(CFLAGS) uso-vars-locales.c variables-locales.o \
	-o uso-vars-locales.out

clean:
	rm vars-locales.o uso-vars-locales.out
