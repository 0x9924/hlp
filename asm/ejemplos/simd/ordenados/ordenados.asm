;; -*- mode:nasm -*-

shuf_impares_mem:
    db 0,1,3,4,6,7,8,10,12,13,ffh,ffh,ffh,ffh,ffh
shuf_pares_mem:
    db 1,2,4,5,7,8,10,11,13,14,ffh,ffh,ffh,ffh,ffh
%define arreglo rdi
%define tam rsi
%define pos_impares xmm15
%define pos_pares xmm14
%define shuf_impares xmm13
%define shuf_pares xmm12
%define comparacion xmm11
%define acumulador xmm10
        
global ordenados
ordenados:
    push rbp
    mov rbp, rsp
    
    movups shuf_impares, [shuf_impares_mem]
    movups shuf_pares, [shuf_pares_mem]

    movups xmm1, [rdi]          ; primeros 5
    movups xmm2, xmm1           ; primeros 10
    movups xmm3, [rdi + 16]     ; primeros 15
    movups xmm4, xmm3           ; primeros 20
    movups xmm5, [rdi + 7]      ; quedan solo cuatro
    movups xmm6, xmm5
    
    pshufb xmm1, shuf_impares
    psrld xmm1, 4               ; las primeras 5 words tienen los primeros
    ; 5 numeros de posicion par
    
    pshufb xmm2, shuf_pares
    psllw xmm2, 4
    psrld xmm2, 4               ; las primeras 5 words tienen los primeros
    ; 5 numeros de pisociones pares
    
    pshufb xmm3, shuf_impares   ;
    psrld xmm3, 4               ; las primeras 5 words tienen los segundos
    ; 5 numeros de pisociones impares
    
    pshufb xmm4, shuf_pares
    psllw xmm4, 4
    psrld xmm4, 4               ; las primeras 5 words tienen los segundos
    ; 5 numeros de pisociones pares

    pshufb xmm5, shuf_impares
    psrld xmm5, 4
    pslldq xmm5, 6
    ; las primeras 2 words tienen los ultimos
    ; 2 numeros de posiciones impares

    pshufb xmm6, shuf_pares
    psllw xmm6, 4
    psrld xmm6, 4
    pslldq xmm6, 6
    ; las primeras 2 words tienen los
    ; 2 numeros de posiciones pares

    pxor acumulador, acumulador
    mov comparacion, xmm2
    pcmpgtd comparacion, xmm1   ; comparo x2 > x1
    por acumulador, comparacion
    mov comparacion, xmm3
    pcmpgtd comparacion, xmm2   ; comparo x3 > x2
    por comparacion, 
    
    
    
    
.ciclo:
    cmp tam, 0
    je .fin
    movdqu data, [arreglo]
    movdqa pos_imparse, data
    movdqa pos_pares, data
    
    pshufb pos_impares, shuf_impares
    pshufb pos_pares, shuf_pares

    psrlw pos_impares, 4
    psllw pos_pares, 4
    psrlw pos_pares, 4

    pslldq pos_pares, 3
    psrldq pos_pares, 3


    jmp .ciclo
.fin:
    pop rbp
    ret
        
