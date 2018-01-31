;;; -*- mode:nasm -*-
global main
extern printf
main:
        push rbx
        mov rsi, rdi
        sub rsp, 8
        
        mov rdi, format         ; primer parametro
        ;;mov rsi, 10             ; segundo parametro
        mov rdx, 20             ; tercer paramtro
        mov rcx, 30             ; cuarto
        mov r8, 40              ; quinto 
        mov r9, 50              ; sexto

        xor rax, rax            ; cantidad de registros xmm usados
        call printf

        add rsp, 8              
        pop  rbx
        ret

section .data
format: DB "rsp: %d", 0xa
;;format: DB "rsp: %d, int2 %d, int3: %d, int4: %d, int5: %d", 0xa
