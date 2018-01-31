;;;  -*- mode:nasm -*-

section .data
ult_bit: dd 7fffffffh,7fffffffh,7fffffffh,7fffffffh,
        
;; void extender_a_32 (numero* nums, int tamanio);

%define numeros rdi
%define tamanio rsi
%define data xmm15




global extender_a_32

extender_a_32:
        push rbp
        mov rbp, rsp
.ciclo:
        cmp tamanio, 0
        je .fin

        movdqu data, [numeros]
        pand data, [ult_bit]
        movdqu [numeros], data

        add numeros, 16
        sub tamanio, 4

        jmp .ciclo
.fin:
        pop rbp
        ret
        
