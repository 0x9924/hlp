;; -* mode:nasm -*-

;; long filtrar_mayores (int *vec, short umbral, int dim);
;;     rdi <- vec
;;     si <- umbral
;;     edx <- dim
        
global filtrar_mayores
section .text
        
filtrar_mayores:        
        mov ecx, 4              
        xor rax, rax
        pxor xmm2, xmm2
        pxor xmm3, xmm3

        pinsrw xmm2, si, 0
        
        por xmm3, xmm2
        por xmm2, xmm3
        
        pslldq xmm3, 2

        por xmm2, xmm3
        por xmm3, xmm2
        
        pslldq xmm3, 4

        por xmm2, xmm3
        por xmm3, xmm2
        
        pslldq xmm3, 8
        por xmm2, xmm3
        

        .ciclo:
        cmp ecx, edx
        jge .fin
        movdqu xmm1, [rdi]
        pcmpgtw xmm1, xmm2 
        movdqu [rdi], xmm1
        add ecx, 4
        add rdi, 16
        inc rax
        jmp .ciclo

.fin:
;;; todo. 
        ;; cmp edx, 3
        ;; je .quedan3
        ;; cmp edx, 2
        ;; je .quedan2
        ;; queda 1
        
        ret
