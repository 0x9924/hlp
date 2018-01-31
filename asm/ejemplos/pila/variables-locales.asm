;; -*- mode:nasm -*-
;;;     NASMFLGS= -f elf64 -g -F DWARF 
;;;     CFLAGS= -g 

%define X_LOCAL(ptr) qword [ptr - 8]
%define Y_LOCAL(ptr) qword [ptr - 16]
%define Z_LOCAL(ptr) qword [ptr - 24]
%define V_LOCAL(ptr) qword [ptr - 32]
%define W_LOCAL(ptr) qword [ptr - 40]
        
        
global var_locales

;; void var_locales (int x, int y, int z, int v, int w);
;;
var_locales:
;; Pusheo primero el base pointer.
;; Esto me permite apuntar a las variables locales y
;; seguir pusheando.
        push rbp
        mov rbp, rsp
;;
;; Ahora voy a reservar lugar para 5 variables locales
;; de 8 bytes (x, y, z ,v, w). 5 * 8 == 40
        sub rsp, 40
        
;; Pusheo después los registros que por la convención C
;; tengo que preservar.
        push rbx
        push r12
        push r13
        push r14
        push r15
        
;; Guardo los parametros como variables locales.
;; Los parametros se pasan así:
;;
;; rdi, rsi, rdx, rcx, r8, r9

        mov X_LOCAL(rbp), rdi
        mov Y_LOCAL(rbp), rsi
        mov Z_LOCAL(rbp), rdx
        mov V_LOCAL(rbp), rcx
        mov W_LOCAL(rbp), r8

;; Ahora popeo
        pop r15
        pop r14
        pop r13
        pop r12
        pop rbx
        
;; Ahora libero las variables locales
        add rsp, 40
        pop rbp
        ret
        

