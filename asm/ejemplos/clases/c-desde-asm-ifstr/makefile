impri : imprime_i.o imprime_pars.o
	 gcc -g -m64 objs/imprime_i.o objs/imprime_pars.o

imprd : imprime_d.o imprime_pars.o
	gcc -g -m64 objs/imprime_d.o objs/imprime_pars.o

imprdc-c : imprime_d-con-c.o imprime_pars.o dame_unof.o
	gcc -g -m64 objs/imprime_d-con-c.o objs/imprime_pars.o objs/dame_unof.o

imprstring : imprime_string.o imprime_pars.o
	 gcc -g -m64 objs/imprime_string.o objs/imprime_pars.o

imprime_i.o : 
	nasm -ggdb -f elf64 imprime_i.asm -o objs/imprime_i.o

imprime_d.o : 
	nasm -ggdb -f elf64 imprime_d.asm -o objs/imprime_d.o

imprime_d-con-c.o : 
	nasm -ggdb -f elf64 imprime_d-con-c.asm -o objs/imprime_d-con-c.o

imprime_string.o : 
	nasm -ggdb -f elf64 imprime_string.asm -o objs/imprime_string.o


imprime_pars.o : imprime_pars.c
	gcc -g -c -m64 imprime_pars.c -o objs/imprime_pars.o

dame_unof.o : dame_unof.c
	gcc -g -c -Wall -m64 dame_unof.c -o objs/dame_unof.o
clean :
	rm objs/*.o
