;;  -*- mode:nasm -*-
;; extern cmp_menos1 (int *arreglo, unsigned tam);

tres_mem: dd 3,3,3,3
        
%define arreglo rdi
%define tam rsi
%define data xmm15
%define tres xmm14
        
global triple
triple:        
        push rbp
        mov rbp, rsp
        movdqu tres, [tres_mem]
.ciclo:
        cmp tam, 0
        je .fin
        movdqu data, [arreglo]
;; multiplico por tres
        pmulld data, tres
        movdqu [arreglo], data
        add arreglo, 16
        sub tam, 4
        jmp .ciclo
.fin:   
        pop rbp
        ret
