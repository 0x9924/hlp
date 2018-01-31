;;; -*- mode:nasm -*-
;;

global str_len
section .text
        
str_len:
        xor rax, rax
.loop:
        mov bl, [rcx]
        cmp bl, 0
        je .end
        inc rax
        inc rcx
        jmp .loop

.end:
        ret
        
