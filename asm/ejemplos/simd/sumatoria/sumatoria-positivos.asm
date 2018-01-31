;; -*- mode:nasm -*-

;; unsigned sumatoria_positivos (numero * nums, int tamanio);
;; tamanio es multilpo de 4.

%define data xmm15
%define suma xmm14

global sumatoria_positivos
        
sumatoria_positivos:
        push rbp
        mov rbp, rsp
        pxor suma, suma
        
.ciclo:
        cmp rsi, 0
        je .fin
        
        movdqu data, [rdi]
        pxor xmm0, xmm0         ; xmm0 <- 0

        pcmpgtd xmm0, data      ; data < 0 => xmm0 <- 1s
;; pero aca data < 0 significa data.validez == 1
        pand data, xmm0
        pslld data, 1
        psrad data, 1

        pxor xmm0, xmm0
        pcmpgtd xmm0, data
        pcmpeqq xmm1, xmm1
        pxor xmm0, xmm1
        pand data, xmm0

        paddd suma, data

        add rdi, 16
        sub rsi, 4
        jmp .ciclo
.fin:
        movdqu xmm0, suma
        psrldq xmm0, 8
        paddd suma, xmm0
        movdqu xmm0, suma
        psrldq xmm0, 4
        paddd suma,  xmm0
        xor rax, rax
        movd eax, suma
        pop rbp
        ret
