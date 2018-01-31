;; -*- mode:nasm -*-
;;; compilar:
;;;     nasm -g -f elf64 -F DWARF ej2b.asm
;;;     gcc  ej2b.o

global main
extern printf
                
section .text
main:
 
        push rbp
        mov rbp, rsp
 
        mov rax, a              ; x/b $rax
        mov rbx, b              ; x/h $rbx
        mov rcx, c              ; x/h $rcx
        mov rdx, d              ; x/w $rdx
        mov rdi, e              ; x/w $rdi
        mov rsi, f              ; x/g $rsi
        mov rbp, g              ; x/g $rbp
        mov r8, h               ; x/w
        ; x/4bd $r8 (para ver los chars en hexa)
        mov rdi, format         ; b ej2.asm:24
        mov rsi, h
        xor rax, rax
        call printf

        pop rbp
        ret

        
section .data
a: db 12h
b: db 12h, 34h
c: dw 1234h
d: dw 1234h, 5678h
e: dd 12345678h
f: dd 12345678h, 9abcdef1h
g: dq 123456789abcdef1h
h: db "1234"
format: DB "%s", 0xa

