; Disassembly of file: switch.o
; Wed Feb  7 18:17:33 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global switch_func: function


SECTION .text   align=1 execute                         ; section number 1, code

switch_func:; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     dword [rbp-14H], edi                    ; 0004 _ 89. 7D, EC
        mov     dword [rbp-4H], 0                       ; 0007 _ C7. 45, FC, 00000000
        mov     eax, dword [rbp-14H]                    ; 000E _ 8B. 45, EC
        cmp     eax, 1                                  ; 0011 _ 83. F8, 01
        jz      ?_003                                   ; 0014 _ 74, 20
        cmp     eax, 1                                  ; 0016 _ 83. F8, 01
        jg      ?_001                                   ; 0019 _ 7F, 06
        test    eax, eax                                ; 001B _ 85. C0
        jz      ?_002                                   ; 001D _ 74, 0E
        jmp     ?_006                                   ; 001F _ EB, 2E

?_001:  cmp     eax, 2                                  ; 0021 _ 83. F8, 02
        jz      ?_004                                   ; 0024 _ 74, 19
        cmp     eax, 3                                  ; 0026 _ 83. F8, 03
        jz      ?_005                                   ; 0029 _ 74, 1D
        jmp     ?_006                                   ; 002B _ EB, 22

?_002:  mov     dword [rbp-4H], 7                       ; 002D _ C7. 45, FC, 00000007
        jmp     ?_007                                   ; 0034 _ EB, 22

?_003:  mov     dword [rbp-4H], 2                       ; 0036 _ C7. 45, FC, 00000002
        jmp     ?_007                                   ; 003D _ EB, 19

?_004:  mov     dword [rbp-4H], 9                       ; 003F _ C7. 45, FC, 00000009
        jmp     ?_007                                   ; 0046 _ EB, 10

?_005:  mov     dword [rbp-4H], 12                      ; 0048 _ C7. 45, FC, 0000000C
?_006:  mov     eax, dword [rbp-14H]                    ; 004F _ 8B. 45, EC
        sub     eax, 2                                  ; 0052 _ 83. E8, 02
        mov     dword [rbp-4H], eax                     ; 0055 _ 89. 45, FC
?_007:  mov     eax, dword [rbp-4H]                     ; 0058 _ 8B. 45, FC
        pop     rbp                                     ; 005B _ 5D
        ret                                             ; 005C _ C3
; switch_func End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .eh_frame align=8 noexecute                     ; section number 4, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd switch_func-$-20H                            ; 0020 _ 00000000 (rel)
        dd 0000005DH, 100E4100H                         ; 0024 _ 93 269369600 
        dd 0D430286H, 0C580206H                         ; 002C _ 222495366 207094278 
        dd 00000807H                                    ; 0034 _ 2055 


