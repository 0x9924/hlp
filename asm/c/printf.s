	.file	"printf.c"
	.intel_syntax noprefix
	.section .rdata,"dr"
.LC1:
	.ascii "%f\0"
	.text
	.globl	foo
	.def	foo;	.scl	2;	.type	32;	.endef
	.seh_proc	foo
foo:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	movabs	rax, 4607182418800017408
	mov	rdx, rax
	mov	QWORD PTR -8[rbp], rdx
	movsd	xmm0, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rcx, .LC1[rip]
	call	printf
	nop
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 5.4.0"
	.def	printf;	.scl	2;	.type	32;	.endef
