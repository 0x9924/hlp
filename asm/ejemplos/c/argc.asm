; Disassembly of file: argc.o
; Tue Aug 29 17:32:09 2017
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global main: function

extern printf                                           ; near


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 16                                 ; 0004 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     qword [rbp-10H], rsi                    ; 000B _ 48: 89. 75, F0
        mov     eax, dword [rbp-4H]                     ; 000F _ 8B. 45, FC
        mov     esi, eax                                ; 0012 _ 89. C6
        mov     edi, ?_001                              ; 0014 _ BF, 00000000(d)
        mov     eax, 0                                  ; 0019 _ B8, 00000000
        call    printf                                  ; 001E _ E8, 00000000(rel)
        leave                                           ; 0023 _ C9
        ret                                             ; 0024 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=1 noexecute                       ; section number 4, const

?_001:                                                  ; byte
        db 25H, 64H, 00H                                ; 0000 _ %d.


SECTION .eh_frame align=8 noexecute                     ; section number 5, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd main-$-20H                                   ; 0020 _ 00000000 (rel)
        dd 00000025H, 100E4100H                         ; 0024 _ 37 269369600 
        dd 0D430286H, 070C6006H                         ; 002C _ 222495366 118251526 
        dd 00000008H                                    ; 0034 _ 8 


