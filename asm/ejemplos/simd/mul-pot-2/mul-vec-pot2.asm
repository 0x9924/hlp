;; -* mode:nasm -*-
%define SIZEOF_DATA 16

;; long mul_vec_pot2 (int *vec, short pot, int dim);
;;     rdi <- vec
;;     si <- pot
;;     edx <- dim
        
global mul_vec_pot2
section .text
mul_vec_pot2:
        xor ecx, ecx
        xor rax, rax
        pxor xmm2, xmm2
        pinsrw xmm2, si, 0

.ciclo:
        cmp ecx, edx
        jge .fin
        movdqu xmm1, [rdi]
        pslld xmm1, xmm2 
        movdqu [rdi], xmm1
        add ecx, 4
        add rdi, 16
        inc rax
        jmp .ciclo

.fin
        ret
