;; -*- mode:nasm -*-
;;; compilar:
;;;     nasm -ggdb -f elf64  hw.asm
;;;     ld -o hw.out hw.o
%define SYS_EXIT 1
%define NO_ERROR 0

%define STDOUT 1
%define SYS_WRITE 4

global main
extern printf
        
section .text
main:
 
        sub rsp, 8
       
        mov rsi, rdi
        mov rdi, format
        xor rax, rax
        call printf


        mov rax, SYS_EXIT
        mov rbx, NO_ERROR
        int 0x80


section .data
format: DB "rsp == argc: %d", 10
