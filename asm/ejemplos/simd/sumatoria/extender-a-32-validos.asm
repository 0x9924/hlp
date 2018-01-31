;;;  -*- mode:nasm -*-
section .rodata
const42_mem: dd 42,42,42,42
;; void extender_a_32 (numero* nums, int tamanio);

%define numeros rdi
%define tamanio rsi
%define data xmm15
%define const42 xmm14



global extender_a_32_validos

extender_a_32_validos:
        push rbp
        mov rbp, rsp
.ciclo:
        cmp tamanio, 0
        je .fin
        movdqu const42, [const42_mem]
        movdqu data, [numeros]
        pxor xmm1, xmm1
        pcmpgtd xmm1, data
;; si data es valido, xmm1 <- 1s
        pand data, xmm1
;; si data es valido data es data, si no data es 0s
        pslld data, 1
        psrld data, 1           ; la consigna dice externder a uints.

        pcmpeqq xmm2, xmm2      ; xmm2 <- 1s
        pxor xmm1, xmm2         ; invierto xmm1
;; ahora si data es  valido, xmm1 <- 0s
        pand const42, xmm1
;; ahora, si data es valido: data = data-extendido y const42 = 0
        ; si data no es valido: data = 0s y const42 = 42 
        por data, const42
        movdqu [numeros], data

        add numeros, 16
        sub tamanio, 4

        jmp .ciclo
.fin:
        pop rbp
        ret
        
