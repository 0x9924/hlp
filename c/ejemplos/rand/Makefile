OBJECTS = ./build/random-bytes.o

random-bytes.o:
	gcc -c -O3 -o ./build/random-bytes.o random-bytes.c


test-randbytes: random-bytes.o
	gcc -O3  ./build/random-bytes.o -o ./build/test-randbytes \
	./test/test-randbytes.c



clean:
	rm ./build/*
