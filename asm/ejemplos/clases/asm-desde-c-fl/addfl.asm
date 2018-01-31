;;; -*- mode:nasm -*-

	global addfl
	section .data
	section .text
addfl:
	push rbp		; apilo la base de la pila
	mov rbp, rsp 		; pongo la base de la pila en el tope
	push rbx		; convención C
	push r12
	push r13
	push r14
	push r15

	addss xmm0, xmm1	
	
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp

	ret
	


