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
        push rcx

        mov rdi, [rdi]          ; l = l -> primero
        mov rcx, rsi            ; 2o param es n
.prox:
        jrcxz .end
        mov rdi, [rdi + 8]
        dec rcx
        jmp .prox
.end:
        mov rax, [rdi]            ; rax <- res
        pop rcx
        pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp

	ret


