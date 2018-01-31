;;; -*- mode:nasm -*-
global	main
extern printf
section .data
string: db "%d"
section .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD [rbp-4], edi
	mov	QWORD [rbp-16], rsi
	mov	eax, DWORD [rbp-4]
	mov	esi, eax
	mov	eax, 0
	call	printf
	mov	eax, 0
	leave
	ret
