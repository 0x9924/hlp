;; -*- mode:nasm -*-

extern get_func
extern store_data

global log_call

        ; la pila :
        ;
        ;       |
        ; rsp > | x
        ;       |
        
log_call:
        push rbp                ; rsp > |rsp_1
        mov rbp, rsp            ; rbp > |rbp_0
        push rsp                ;       |  x

        push rax
        push rcx
        push rdx
        push rdi
        push rsi
        push r8
        push r9
        push r10
        push r11

        mov rdi, [rbp + 8]      ; rdi <- x
        call get_func           ; rax <- addr_fun

        mov rcx, rax            ; 3er param : addr_fun
        mov rsi, [rbp]          ; 2o param  : rbp_0
        mov rdi, [rbp - 8]      ; rsp_0 == rsp_1 + 8
        sub rsi, 8              ; 1er param : rsp_0

        mov [rbp], rax          ; [rbp] <- addr_fun
        call store_data


        pop r11
        pop r10
        pop r9
        pop r8
        pop rsi
        pop rdi
        pop rdx
        pop rcx
;; Ahora la pila es:
        ; rsp >  | rax
        ;        | addr_fun
        ;        | rbp
        ;        |   x
        
        mov rax [rsp + 8]       ; rax  <- addr_fun
        mov rbp [rsp + 16]      ; rbp  <- rbp_0
        mov [rsp + 24], rax     ; [rsp + 24] <- addr_fun
        pop rax
        sub rsp, 8

;; Y ahora:
        ; rsp > | addr_fun
        ;       | x
        ret

;; finalmente, tras el ret:
        ;
        ; rsp > | x
        ;       |

;; Y rip == addr_fun
        

        
