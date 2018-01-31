;;; -*- mode:nasm -*-

global enesimo

section .text
enesimo:
        push rbp
        mov rbp, rsp
        push rbx		; convencio'n C
	push r12                ;
	push r13                ;
	push r14                ;
	push r15                ;

        mov rcx, [rcx]          ; 1er param
.loop:
        cmp rdx, 0
        je .end
        dec rdx            ; 2o param es n
        mov rcx, [rcx + 8]
        jmp .loop
.end:
        mov rax, [rcx]            ; rax <- res

        pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp

	ret


