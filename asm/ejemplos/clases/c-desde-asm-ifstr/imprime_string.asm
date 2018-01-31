        section .data
msg:    DB 'Hola mundo llamando a c', 10
        largo EQU $- msg
	global main
	extern imprime_string

	section .text
main :
        mov rdi, msg
	call imprime_string
        mov rax, 1              ; exit
        mov rbx, 0              ; error code 0 = NO_ERROR
        int 0x80                ; interrupt

