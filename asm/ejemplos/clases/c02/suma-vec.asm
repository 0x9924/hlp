;;; -*- mode:nasm -*-
	
global suma

section .text

suma:
;; arranco desalineado porque se pushea la dir de retorno
;; (igual no hace falta alinear porque no us ofun en c)
	push rbp     
;; ahora alineado   
	mov rbp, rsp
	push r12 
;; ahora desalineado
	sub rsp, 8

	xor rcx, rcx
	mov cx, si
	xor r12, r12		; acumulador 
.ciclo:
	add r12w, [rdi]
	add rdi, 2
	loop .ciclo
	
	mov rax, r12

;desarmar stackframe	
	add rsp, 8
	pop r12
	pop rbp

	ret
	
