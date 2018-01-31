	global main
	extern imprime_double
        extern dame_unof

        
	section .text
main:
        sub rsp, 8              ; alineamos la pila en 16
        call dame_unof
	call imprime_double
        add rsp, 8              ; dejamos la pila como estaba
        mov rax, 1              ; exit
        mov rbx, 0              ; error code 0 - NO_ERROR
        int 0x80


