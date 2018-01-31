impr : imprime_i.o imprime_pars.o
	gcc -g -m64 objs/imprime_i.o objs/imprime_pars.o

imprime_i.o : 
	nasm -ggdb -f elf64 imprime_i.asm -o objs/imprime_i.o
imprime_pars.o : imprime_pars.c
	gcc -g -c -m64 imprime_pars.c -o objs/imprime_pars.o


clean :
	rm a.out objs/*.o
