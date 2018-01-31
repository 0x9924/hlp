GSL_FLAGS = -L/usr/local/lib -lgsl -lgslcblas -lm


hw:
	gcc gsl-hw.c -o ./build/hw $(GSL_FLAGS) 

random-int:
	gcc random-int.c -o ./build/random-int $(GSL_FLAGS) 

random-array-ulong.o:
	gcc -g xrandom-array-ulong.c -c \
	-o ./build/random-array-ulong.o $(GSL_FLAGS) 

random-array-double.o:
	gcc random-array-double.c -c -o ./build/random-array-double.o \
	$(GSL_FLAGS)



test-random-array-ulong: random-array-ulong.o
	gcc -g ./tests/test-random-array-ulong.c \
	./build/random-array-ulong.o \
	-o ./build/test-random-array-ulong  \
	$(GSL_FLAGS) 

test-random-array-double: random-array-double.o
	gcc ./tests/test-random-array-double.c \
	./build/random-array-double.o \
	-o ./build/test-random-array-double \
	$(GSL_FLAGS)

clean:
	rm ./build/*
