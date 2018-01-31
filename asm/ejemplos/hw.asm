;; -*- mode:nasm -*-

;;; compilar:
;;;     nasm -ggdb -f elf64  hw.asm
;;;     ld -o hw.out hw.o

section .data
msg:    DB 'Hola mundo', 10
        largo EQU $- msg
global _start
section .text
_start: mov rax, 4              ; sys write
        mov rbx, 1              ; fd stdout
        mov rcx, msg            ; buf
        mov rdx, largo          ; count
        int 0x80                ;; interrupcion de software
        mov rax, 1              ; exit
        mov rbx, 0              ; error code 0 - NO_ERROR
        int 0x80
