;; -*- mode:nasm -*-
;;;     nasm -ggdb -f elf64 prinf.asm
;;;     gcc -m64 printf.o

global main
extern printf
main:
        push rbx
        sub rsp, 8

        mov rdi, format         ; primer parametro
        mov rsi, 10             ; segundo parametro
        mov rdx, 20             ; tercer paramtro
        mov rcx, 30             ; cuarto
        mov r8, 40              ; quinto 
        mov r9, 50              ; sexto

        xor rax, rax            ; cantidad de registros xmm usados
        call printf

        add rsp, 8              
        pop  rbx
        ret

section .data
format: DB "int1: %d, int2 %d, int3: %d, int4: %d, int5: %d", 0xa 
