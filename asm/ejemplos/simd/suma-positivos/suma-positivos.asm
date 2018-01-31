;; long void suma_positivos (char * nums, short len);
%define data xmm15
%define posl xmm14
%define posh xmm13
%define suma xmm12
%define index cx
    
global suma_positivos
suma_positivos:
    push rbp
    mov rbp, rsp
    pxor suma, suma
    mov index, si
    
.ciclo:
    cmp index, 0
    je .fin

    movdqu data, [rdi]
    pxor xmm0, xmm0
    pcmpeqq xmm1, xmm1

    pcmpgtb xmm0, data          ; data < 0 => x0 <- 1s
    pxor xmm0,xmm1              ; data < 0 => x0 <- 0s

    pand data, xmm0
    
    movdqa posl, data
    movdqa posh, data

    pxor xmm0, xmm0             ;como son positivos desempaqueto ccon 0s
    punpckhbw posh, xmm0
    punpcklbw posl, xmm0

    paddw posl, posh
    paddw suma, posl

    sub index, 16
    add rdi, 16
    jmp .ciclo

.fin:
    
    movdqa xmm0, suma
    psrldq xmm0, 8
    paddw suma, xmm0

    movdqa xmm0, suma
    psrldq xmm0, 4
    paddw suma, xmm0

    movdqa xmm0, suma
    psrldq xmm0, 2
    paddw suma, xmm0

    pslldq suma, 14
    psrldq suma, 14
    movq rax, suma
    
    pop rbp
    ret
    
    
    
