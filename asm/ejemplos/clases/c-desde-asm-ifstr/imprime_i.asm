	global main
	extern imprime_int
	section .text
main:	mov rdi, 7
	call imprime_int
        mov rax, 1              ; exit
        mov rbx, 0              ; error code 0 - NO_ERROR
        int 0x80



