; Disassembly of file: op-ternario2.o
; Sat Feb  3 09:22:45 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 80386, x64

default rel

global op_ternario: function


SECTION .text   align=1 execute                         ; section number 1, code

op_ternario:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 0004 _ 89. 7D, FC
        cmp     dword [rbp-4H], 0                       ; 0007 _ 83. 7D, FC, 00
        setne   al                                      ; 000B _ 0F 95. C0
        movzx   eax, al                                 ; 000E _ 0F B6. C0
        pop     rbp                                     ; 0011 _ 5D
        ret                                             ; 0012 _ C3
; op_ternario End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .eh_frame align=8 noexecute                     ; section number 4, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd op_ternario-$-20H                            ; 0020 _ 00000000 (rel)
        dd 00000013H, 100E4100H                         ; 0024 _ 19 269369600 
        dd 0D430286H, 070C4E06H                         ; 002C _ 222495366 118246918 
        dd 00000008H                                    ; 0034 _ 8 


