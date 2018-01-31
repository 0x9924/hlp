	;;; compilar:
	;;;     nasm -ggdb -f elf64  echo.asm
	;;;     ld echo.o

        section .data
msg0:   DB 'Escribi una linea: '
        largo0 EQU $- msg0
        global _start

msg1:   DB 'La linea escrita es: ', 10
        largo1 EQU $- msg1
        global _start

        
        section .bss
        num resb 256
        
        section .text
_start:
        ;; escribo "Escribi una linea:"
        mov rax, 4              ; sys write
        mov rbx, 1              ; fd stdout
        mov rcx, msg0            ; buf
        mov rdx, largo0          ; count
        int 0x80                ;; interrupcion de software

        ;; Leo el numero
        mov rax, 3              ; sys read
        mov rbx, 2              ;
        mov rcx, num
        mov rdx, 256              ;5 bytes
        int 0x80


        ;; escribo "La linea escrita es: "
        mov rax, 4              ; sys write
        mov rbx, 1              ; fd stdout
        mov rcx, msg1            ; buf
        mov rdx, largo1          ; count
        int 0x80                ;; interrupcion de software

        ;; Escribo el input
        mov rax, 4
        mov rbx, 1
        mov rcx, num
        mov rdx, 256
        int 0x80

        ;; Exit
        mov rax, 1              ; exit
        mov rbx, 0              ; error code 0 - NO_ERROR
        int 0x80
