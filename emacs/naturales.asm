;;  -*- mode:nasm -*-
;; extern sacar_negativos (int *arreglo, unsigned len);

%define arreglo rdi
%define len rsi
%define data xmm15
        
global sacar_negativos  
sacar_negativos:
        push rbp
        mov rbp, rsp
        
.ciclo:
        cmp len, 0
        je .fin

        movdqu data, [arreglo]
        pcmpeqq xmm1, xmm1      ;x1 <- 1s
        pcmpgtd xmm1
