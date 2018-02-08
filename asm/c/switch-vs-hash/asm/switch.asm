; Disassembly of file: switch.o
; Wed Feb  7 22:46:19 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global foo: function
global main: function
global veces

extern __stack_chk_fail                                 ; near
extern sum_strings                                      ; near
extern sum_floats                                       ; near
extern sum_ints                                         ; near


SECTION .text   align=1 execute                         ; section number 1, code

foo:    ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 32                                 ; 0004 _ 48: 83. EC, 20
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0008 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 0011 _ 48: 89. 45, F8
        xor     eax, eax                                ; 0015 _ 31. C0
        mov     dword [rbp-14H], 20                     ; 0017 _ C7. 45, EC, 00000014
        movss   xmm0, dword [rel ?_021]                 ; 001E _ F3: 0F 10. 05, 00000000(rel)
        movss   dword [rbp-1CH], xmm0                   ; 0026 _ F3: 0F 11. 45, E4
        movss   xmm0, dword [rel ?_022]                 ; 002B _ F3: 0F 10. 05, 00000000(rel)
        movss   dword [rbp-18H], xmm0                   ; 0033 _ F3: 0F 11. 45, E8
        cmp     dword [rbp-14H], 13                     ; 0038 _ 83. 7D, EC, 0D
        ja      ?_015                                   ; 003C _ 0F 87, 00000186
        mov     eax, dword [rbp-14H]                    ; 0042 _ 8B. 45, EC
; Note: Address is not rip-relative
        mov     rax, qword [abs ?_020+rax*8]            ; 0045 _ 48: 8B. 04 C5, 00000000(d)
        jmp     rax                                     ; 004D _ FF. E0

?_001:  lea     rdx, [rbp-18H]                          ; 004F _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 0053 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 0057 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 005B _ 48: 89. CE
        mov     rdi, rax                                ; 005E _ 48: 89. C7
        call    sum_ints                                ; 0061 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 0066 _ E9, 00000174

?_002:  lea     rdx, [rbp-18H]                          ; 006B _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 006F _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 0073 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0077 _ 48: 89. CE
        mov     rdi, rax                                ; 007A _ 48: 89. C7
        call    sum_floats                              ; 007D _ E8, 00000000(rel)
        jmp     ?_016                                   ; 0082 _ E9, 00000158

?_003:  lea     rdx, [rbp-18H]                          ; 0087 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 008B _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 008F _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0093 _ 48: 89. CE
        mov     rdi, rax                                ; 0096 _ 48: 89. C7
        call    sum_strings                             ; 0099 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 009E _ E9, 0000013C

?_004:  lea     rdx, [rbp-18H]                          ; 00A3 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 00A7 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 00AB _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 00AF _ 48: 89. CE
        mov     rdi, rax                                ; 00B2 _ 48: 89. C7
        call    sum_floats                              ; 00B5 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 00BA _ E9, 00000120

?_005:  lea     rdx, [rbp-18H]                          ; 00BF _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 00C3 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 00C7 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 00CB _ 48: 89. CE
        mov     rdi, rax                                ; 00CE _ 48: 89. C7
        call    sum_floats                              ; 00D1 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 00D6 _ E9, 00000104

?_006:  lea     rdx, [rbp-18H]                          ; 00DB _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 00DF _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 00E3 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 00E7 _ 48: 89. CE
        mov     rdi, rax                                ; 00EA _ 48: 89. C7
        call    sum_floats                              ; 00ED _ E8, 00000000(rel)
        jmp     ?_016                                   ; 00F2 _ E9, 000000E8

?_007:  lea     rdx, [rbp-18H]                          ; 00F7 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 00FB _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 00FF _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0103 _ 48: 89. CE
        mov     rdi, rax                                ; 0106 _ 48: 89. C7
        call    sum_floats                              ; 0109 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 010E _ E9, 000000CC

?_008:  lea     rdx, [rbp-18H]                          ; 0113 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 0117 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 011B _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 011F _ 48: 89. CE
        mov     rdi, rax                                ; 0122 _ 48: 89. C7
        call    sum_floats                              ; 0125 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 012A _ E9, 000000B0

?_009:  lea     rdx, [rbp-18H]                          ; 012F _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 0133 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 0137 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 013B _ 48: 89. CE
        mov     rdi, rax                                ; 013E _ 48: 89. C7
        call    sum_floats                              ; 0141 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 0146 _ E9, 00000094

?_010:  lea     rdx, [rbp-18H]                          ; 014B _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 014F _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 0153 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0157 _ 48: 89. CE
        mov     rdi, rax                                ; 015A _ 48: 89. C7
        call    sum_floats                              ; 015D _ E8, 00000000(rel)
        jmp     ?_016                                   ; 0162 _ EB, 7B

?_011:  lea     rdx, [rbp-18H]                          ; 0164 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 0168 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 016C _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0170 _ 48: 89. CE
        mov     rdi, rax                                ; 0173 _ 48: 89. C7
        call    sum_floats                              ; 0176 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 017B _ EB, 62

?_012:  lea     rdx, [rbp-18H]                          ; 017D _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 0181 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 0185 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 0189 _ 48: 89. CE
        mov     rdi, rax                                ; 018C _ 48: 89. C7
        call    sum_floats                              ; 018F _ E8, 00000000(rel)
        jmp     ?_016                                   ; 0194 _ EB, 49

?_013:  lea     rdx, [rbp-18H]                          ; 0196 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 019A _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 019E _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 01A2 _ 48: 89. CE
        mov     rdi, rax                                ; 01A5 _ 48: 89. C7
        call    sum_floats                              ; 01A8 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 01AD _ EB, 30

?_014:  lea     rdx, [rbp-18H]                          ; 01AF _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 01B3 _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 01B7 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 01BB _ 48: 89. CE
        mov     rdi, rax                                ; 01BE _ 48: 89. C7
        call    sum_floats                              ; 01C1 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 01C6 _ EB, 17

?_015:  lea     rdx, [rbp-18H]                          ; 01C8 _ 48: 8D. 55, E8
        lea     rcx, [rbp-1CH]                          ; 01CC _ 48: 8D. 4D, E4
        lea     rax, [rbp-10H]                          ; 01D0 _ 48: 8D. 45, F0
        mov     rsi, rcx                                ; 01D4 _ 48: 89. CE
        mov     rdi, rax                                ; 01D7 _ 48: 89. C7
        call    sum_floats                              ; 01DA _ E8, 00000000(rel)
?_016:  nop                                             ; 01DF _ 90
        mov     rax, qword [rbp-8H]                     ; 01E0 _ 48: 8B. 45, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rax, qword [fs:abs 28H]                 ; 01E4 _ 64 48: 33. 04 25, 00000028
        jz      ?_017                                   ; 01ED _ 74, 05
        call    __stack_chk_fail                        ; 01EF _ E8, 00000000(rel)
?_017:  leave                                           ; 01F4 _ C9
        ret                                             ; 01F5 _ C3
; foo End of function

main:   ; Function begin
        push    rbp                                     ; 01F6 _ 55
        mov     rbp, rsp                                ; 01F7 _ 48: 89. E5
        sub     rsp, 16                                 ; 01FA _ 48: 83. EC, 10
        mov     dword [rbp-4H], 0                       ; 01FE _ C7. 45, FC, 00000000
        jmp     ?_019                                   ; 0205 _ EB, 0E

?_018:  mov     eax, 0                                  ; 0207 _ B8, 00000000
        call    foo                                     ; 020C _ E8, 00000000(rel)
        add     dword [rbp-4H], 1                       ; 0211 _ 83. 45, FC, 01
?_019:  mov     eax, 9999999                            ; 0215 _ B8, 0098967F
        cmp     dword [rbp-4H], eax                     ; 021A _ 39. 45, FC
        jl      ?_018                                   ; 021D _ 7C, E8
        mov     eax, 0                                  ; 021F _ B8, 00000000
        leave                                           ; 0224 _ C9
        ret                                             ; 0225 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=8 noexecute                       ; section number 4, const

veces:                                                  ; dword
        dd 0098967FH, 00000000H                         ; 0000 _ 9999999 0 

?_020:                                                  ; switch/case jump table
        dq ?_002                                        ; 0008 _ 0000000000000000 (d)
        dq ?_001                                        ; 0010 _ 0000000000000000 (d)
        dq ?_004                                        ; 0018 _ 0000000000000000 (d)
        dq ?_003                                        ; 0020 _ 0000000000000000 (d)
        dq ?_005                                        ; 0028 _ 0000000000000000 (d)
        dq ?_006                                        ; 0030 _ 0000000000000000 (d)
        dq ?_007                                        ; 0038 _ 0000000000000000 (d)
        dq ?_008                                        ; 0040 _ 0000000000000000 (d)
        dq ?_009                                        ; 0048 _ 0000000000000000 (d)
        dq ?_010                                        ; 0050 _ 0000000000000000 (d)
        dq ?_011                                        ; 0058 _ 0000000000000000 (d)
        dq ?_012                                        ; 0060 _ 0000000000000000 (d)
        dq ?_013                                        ; 0068 _ 0000000000000000 (d)
        dq ?_014                                        ; 0070 _ 0000000000000000 (d)

?_021:  dd 41100000H                                    ; 0078 _ 9.0 

?_022:  dd 414028F6H                                    ; 007C _ 12.01 


SECTION .eh_frame align=8 noexecute                     ; section number 5, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd foo-$-20H                                    ; 0020 _ 00000000 (rel)
        dd 000001F6H, 100E4100H                         ; 0024 _ 502 269369600 
        dd 0D430286H, 01F10306H                         ; 002C _ 222495366 32572166 
        dd 0008070CH, 0000001CH                         ; 0034 _ 526092 28 
        dd 0000003CH                                    ; 003C _ 60 
        dd foo-$+1B6H                                   ; 0040 _ 00000000 (rel)
        dd 00000030H, 100E4100H                         ; 0044 _ 48 269369600 
        dd 0D430286H, 070C6B06H                         ; 004C _ 222495366 118254342 
        dd 00000008H                                    ; 0054 _ 8 


