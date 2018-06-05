# C_FILES = $(wildcard src/*.c)
# _OBJS = $(subst .cpp,.o, $(C_FILES))
# ODIR=obj
# OBJECTS = $(subst src/,, $(patsubst %,$(ODIR)/%,$(_OBJS)))

CFLAGS = -g  

obj/%.o: %.c obj
	gcc -g -c -o $@ $<

# %.o: %.c obj
# 	gcc -c -o obj/$@ $<

int-search: obj/ga-randints.o obj/ga-print.o
	gcc -o build/$@ $@/$@.c $^ 


clean:
	rm obj/*
	rm build/*
