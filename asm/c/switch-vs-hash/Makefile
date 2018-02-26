CFLAGS = -c -Wall -g -Os

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

clean:
	rm build/*
