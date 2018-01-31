;;  -*- mode:nasm -*-
;; extern hashear (int *arreglo, unsigned k);
;; len(arreglo) == 64

nciclos: dq 16
tres_mem: dd 3,3,3,3
uno_mem:dd 1,1,1,1
        
%define arreglo rdi
%define K rsi
%define data xmm15
%define temp xmm14
%define tres xmm13
%define uno xmm12
%define caso_mayor xmm11
%define caso_menor xmm10
        
global hashear
hashear:
        
        push rbp
        mov rbp, rsp
        xor rcx, rcx
        mov rcx, [nciclos]
        movdqu tres, [tres_mem]
        movdqu uno, [uno_mem]
        
.ciclo:
        movdqu data, [arreglo]
        movdqa caso_mayor, data
        movdqa caso_menor, data
        
        pmulld caso_mayor, tres
        paddd caso_mayor, uno

        paddd caso_menor, uno
        psrad caso_menor, 1
        
        pxor xmm1, xmm1
        movdqa temp, data 
        pcmpgtd temp, xmm1
;; data > 0 => temp <- 1s
        pand caso_mayor, temp
        pcmpeqq xmm1, xmm1
        pxor xmm1, temp
        pand caso_menor,xmm1

        por caso_mayor, caso_menor

        movdqu [arreglo], caso_mayor
        add arreglo, 16
        loop .ciclo

.fin:
        pop rbp
        ret
