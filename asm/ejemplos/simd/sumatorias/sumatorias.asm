%define fila0 xmm15
%define fila1 xmm14
%define fila2 xmm13
%define fila3 xmm12
%define suma_cols xmm11

%macro sumar_fila 2
    movdqu %1, %2
    phaddd %1, %1
    phaddd %1, %1
    psubd %1, %2
%endmacro

global sumatorias
sumatorias:
    push rbp
    mov rbp, rsp
    
    movdqu fila0, [rdi]
    movdqu fila1, [rdi + 16]
    movdqu fila2, [rdi + 32]
    movdqu fila3, [rdi + 48]

    movdqu suma_cols, fila0
    paddd suma_cols, fila1
    paddd suma_cols, fila2
    paddd suma_cols, fila3

    sumar_fila xmm1, fila0
    paddd xmm1, suma_cols
    movdqu [rsi], xmm1
    
    sumar_fila xmm1, fila1
    paddd xmm1, suma_cols
    movdqu [rsi + 16], xmm1

    sumar_fila xmm1, fila2
    paddd xmm1, suma_cols
    movdqu [rsi + 32], xmm1

    sumar_fila xmm1, fila3
    paddd xmm1, suma_cols
    movdqu [rsi + 48], xmm1

.fin:

    pop rbp
    ret
    
    
