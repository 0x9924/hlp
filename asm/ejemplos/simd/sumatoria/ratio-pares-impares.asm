;; -*- mode:nasm -*-

%define numeros_mem rdi
%define tamanio rsi
%define data xmm15
%define pares xmm0
%define impares xmm13
%define suma_pares xmm12
%define suma_impares xmm11
        
global ratio_pares_impares
ratio_pares_impares:
        push rbp
        mov rbp, rsp
        pxor pares, pares
        pxor impares, impares
        
.ciclo:
        cmp tamanio, 0
        je .fin
        movdqu data, [numeros_mem] ; obtengo data
        pslld data, 1
        psrld data, 1           ; limpio bit validez
        movdqu xmm1, data          ; copio data
        psrld xmm1, 1
        pslld xmm1, 1           ; limpio impar
        pcmpeqd xmm1, data
;; si data es par => xmm1 <- 1s
        movdqu xmm2, data
        pand xmm2, xmm1         ; xmm2 <- pares
        paddd pares, xmm2
        
        pcmpeqq xmm2, xmm2      ;xmm2 <- 1s
        pxor xmm1, xmm2         ; invierto xmm1
;; si data es par => xmm1 <- 0s
        movdqu xmm2, data
        pand xmm2, xmm1         ; xmm2 <- impares
        paddd impares, xmm2

        add numeros_mem, 16
        sub tamanio, 4
        jmp .ciclo
.fin:
        movdqa suma_pares, pares
        movdqa suma_impares, impares
        movdqa xmm1, impares
        movdqa xmm2, pares

        psrldq xmm1, 8
        psrldq xmm2, 8

        paddd impares, xmm1
        paddd pares, xmm2

        movdqu xmm1, impares
        movdqu xmm2, pares

        psrldq xmm1, 4
        psrldq xmm2, 4

        paddd impares, xmm1
        paddd pares, xmm2

        cvtdq2ps impares, impares
        cvtdq2ps pares, pares

        divss pares, impares
        pop rbp
        ret
        
