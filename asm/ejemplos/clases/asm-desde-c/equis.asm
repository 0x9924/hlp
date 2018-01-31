	global equis
	section .data
	section .text
equis:
	push rbp		; apilo la base de la pila
	mov rbp, rsp 		; pongo la base de la pila en el tope
	push rbx		; convención C
	push r12
	push r13
	push r14
	push r15

	mov rax, rdi

	
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp

	ret
	


