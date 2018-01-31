;; -*- mode:nasm -*-
%define BYTES_IN_REG 16
%define WORDS_IN_REG 16
;; long filtrar_mayores (int *vec, short umbral, int dim);
;;     rdi <- vec
;;     rsi <- vec_out
;;     edx <- dim
        
global extender_vector_ubw
section .text
        
extender_vector_ubw:        
        xor rcx, rcx
        

.ciclo:
        cmp ecx, edx
        jge .fin
        movdqu xmm1, [rdi] 
        movdqu xmm2, xmm1
        
        pxor xmm3, xmm3
        
        punpcklbw xmm1, xmm3
        movdqu [rsi], xmm1

        punpckhbw xmm2, xmm3
        movdqu [rsi + 16], xmm2

        add rdi, 16
        add rsi, 32
        inc ecx
        jmp .ciclo

.fin:
        ret
