        global main
        extern printf
main:
        push rbx
        mov rbx, 42
        mov rsi, rbx
        mov rdi, format
        mov rax, 0
        call printf

        xor  rax, rax
        pop  rbx
        ret

        section .data
format: DB "int: %d", 0xa 
