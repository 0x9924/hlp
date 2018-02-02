; Disassembly of file: suma.o
; Fri Feb  2 18:38:02 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global suma: function


SECTION .text   align=1 execute                         ; section number 1, code

suma:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0004 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0007 _ 89. 75, F8
        mov     edx, dword [rbp-4H]                     ; 000A _ 8B. 55, FC
        mov     eax, dword [rbp-8H]                     ; 000D _ 8B. 45, F8
        add     eax, edx                                ; 0010 _ 01. D0
        pop     rbp                                     ; 0012 _ 5D
        ret                                             ; 0013 _ C3
; suma End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .eh_frame align=8 noexecute                     ; section number 4, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd suma-$-20H                                   ; 0020 _ 00000000 (rel)
        dd 00000014H, 100E4100H                         ; 0024 _ 20 269369600 
        dd 0D430286H, 070C4F06H                         ; 002C _ 222495366 118247174 
        dd 00000008H                                    ; 0034 _ 8 


