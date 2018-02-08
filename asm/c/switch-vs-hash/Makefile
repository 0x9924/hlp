

switch:switch-vs-hash.o
	gcc switch.c build/switch-vs-hash.o -o build/$@

switch.o:
	gcc -c switch.c -o build/$@

hash:switch-vs-hash.o
	gcc hash.c build/switch-vs-hash.o -o build/$@

hash.o:
	gcc -c hash.c  -o build/$@

switch-vs-hash.o:
	gcc -o build/$@ -c switch-vs-hash.c

clean:
	rm build/*
