CFLAGS = -c -Wall -g -O3

all: switch hash
switch:switch-vs-hash.o
	gcc switch.c build/switch-vs-hash.o -o build/$@
hash:switch-vs-hash.o
	gcc hash.c build/switch-vs-hash.o -o build/$@

switch.o:
	gcc $(CFLAGS) switch.c -o build/$@


hash.o:
	gcc $(CFLAGS) -c hash.c  -o build/$@

switch-vs-hash.o:
	gcc -o build/$@ $(CFLAGS) switch-vs-hash.c


hash.asm: hash.o
	objconv -fnasm build/hash.o

switch.asm: switch.o
	objconv -fnasm build/switch.o

clean:
	rm build/*
