;; -*- mode:nasm-*-

;; float promedio_negativos(numero * nums, tamanio);

%define numeros rdi
%define tamanio rsi
%define data xmm15
%define suma xmm0
%define tamanio_float xmm13

global promedio_negativos
        
promedio_negativos:
        push rbp
        mov rbp, rsp

        cvtsi2ss tamanio_float, tamanio
        pxor suma, suma
        
.ciclo:
        cmp tamanio, 0
        je .fin
        movdqu data, [numeros]
        ; chequeo validez
        pxor xmm1, xmm1         ; xmm1 <- 0s
        pcmpgtd xmm1, data      ; data < 0 => xmm1 <- 1s
        pand data, xmm1
        pslld data, 1
        psrad data, 1           ; signo extendido
        ; chequeo signo, descarto positivos
        pxor xmm1, xmm1         ; xmm1 <- 0s
        pcmpgtd xmm1, data      ; data < 0 => zmm1 <- 1s
        pand data, xmm1         ; data >= 0 data <- 0s

        paddd suma, data
        add numeros, 16
        sub tamanio, 4
        jmp .ciclo
        
.fin:
        movdqa xmm1, suma
        psrldq xmm1, 8
        paddd suma, xmm1
        movdqa xmm1, suma
        psrldq xmm1, 4
        paddd suma, xmm1
        cvtdq2ps suma, suma
        divss suma, tamanio_float
        
        pop rbp
        ret
        
