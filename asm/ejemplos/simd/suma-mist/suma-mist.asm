%define a xmm15
%define b xmm14
%define c xmm13
    
global suma_mist
suma_mist:
    push rbp
    mov rbp, rsp

.ciclo:
    cmp rsi, 0
    je .fin

    movdqu a, [rdi]
    movdqu b, a
    movdqu c, a

    pslld b, 9
    psrld b, 22
    pslld c, 19
    psrld c, 19
    pxor xmm1, xmm1
    movdqu xmm2, a
    pcmpgtd xmm2, xmm1
    pand c, xmm2
;; a <= 0 => c <- 0s, si no no
    psrld a, 23

    paddd a, b
    paddd a, c
    movdqu [rdx], a
    add rdi, 16
    add rdx, 16
    sub rsi, 4
    jmp .ciclo
.fin:

    pop rbp
    ret
    
    
