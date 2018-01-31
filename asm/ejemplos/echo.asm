;; -*- mode:nasm -*-
;; create executable this way:
;; nasm -f elf64 -g -F stabs echo.asm
;; gcc -o echo echo.o

extern printf
section .data
format: db '%s', 10, 0

section .text

global main

main:
        mov rcx, rdi        ; argc
        mov r8, 0           ; offset
repeat:
        mov rdx, qword [rsi+r8] ; argv

        push rcx            ; save registers that printf wastes
        push rdx
        push rsi
        push r8

        mov rdi, format     ; primer parametro de printf
        mov rsi, rdx        ; segundo
        mov rax, 0          ; sin parametros en xmmN
        call printf         

        pop r8              ; restore registers
        pop rsi
        pop rdx
        pop rcx

        add r8, 8           ; argument siguiente
        loop repeat

        mov rax, 1
        mov rbx, 0
        int 80h
