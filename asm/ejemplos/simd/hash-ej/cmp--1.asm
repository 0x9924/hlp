;;  -*- mode:nasm -*-
;; extern cmp_menos1 (int *arreglo, unsigned tam);


%define arreglo rdi
%define tam rsi
%define data xmm15
        
global cmp_menos1
cmp_menos1:        
        push rbp
        mov rbp, rsp

.ciclo:
        cmp tam, 0
        je .fin
        movdqu data, [arreglo]
        pcmpeqd xmm1, xmm1
        pcmpgtd xmm1, data
;; data < -1 => x1 <- 1s
        pand data, xmm1
        
        movdqu [arreglo], data

        add arreglo, 16
        sub tam, 4
        jmp .ciclo
.fin:   
        pop rbp
        ret
