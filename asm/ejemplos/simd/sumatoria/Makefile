NASM=nasm
NASMFLAGS=-g -f elf64 -F DWARF
CC=gcc
CFLAGS=-O3 -g

RANDBYTES=~/hlp/c/ejemplos/rand/build/random-bytes.o

main: sumatoria-positivos promedio-negativos extender-a-32 \
	extender-a-32-validos ratio-pares-impares 
	$(CC) $(CFLAGS) $@.c build/sumatoria-positivos.o \
	build/promedio-negativos.o \
	build/extender-a-32.o \
	build/extender-a-32-validos.o \
	build/ratio-pares-impares.o \
	$(RANDBYTES) -o build/$@.out

tests: sumatoria-positivos promedio-negativos extender-a-32 \
	extender-a-32-validos ratio-pares-impares 
	$(CC) $(CFLAGS) $@.c build/sumatoria-positivos.o \
	build/promedio-negativos.o \
	build/extender-a-32.o \
	build/extender-a-32-validos.o \
	build/ratio-pares-impares.o \
	$(RANDBYTES) -o build/$@.out

sumatoria-positivos:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

promedio-negativos:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

extender-a-32:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

extender-a-32-validos:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

ratio-pares-impares:
	$(NASM) $(NASMFLAGS) $@.asm -o build/$@.o

clean:
	rm build/*

