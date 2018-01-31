	global main
	extern imprime_int
	section .text
main:	mov rcx, 7
	call imprime_int	
	ret

