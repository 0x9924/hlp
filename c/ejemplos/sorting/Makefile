LIB=$(HOME)/lib
INCLUDE=$(HOME)/include
qsort.o:
	gcc qsort.c -c -o build/$@
sort-ej: qsort.o
	gcc sort-ej.c build/qsort.o -o build/$@ -I$(INCLUDE) -L$(LIB) -lrandbytes

sort-ej2: qsort.o
	gcc sort-ej.c build/qsort.o -o build/$@ -I$(INCLUDE) -L$(LIB) -lrandbytes
