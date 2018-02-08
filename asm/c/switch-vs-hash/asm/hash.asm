; Disassembly of file: build/hash.o
; Wed Feb  7 22:48:02 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global sum_g: function
global foo: function
global main: function
global sum_funcs
global veces

extern __stack_chk_fail                                 ; near
extern sum_strings                                      ; near
extern sum_ints                                         ; near
extern sum_floats                                       ; near


SECTION .text   align=1 execute                         ; section number 1, code

sum_g:  ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 32                                 ; 0004 _ 48: 83. EC, 20
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     qword [rbp-10H], rsi                    ; 000B _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 000F _ 48: 89. 55, E8
        mov     qword [rbp-20H], rcx                    ; 0013 _ 48: 89. 4D, E0
        mov     eax, dword [rbp-4H]                     ; 0017 _ 8B. 45, FC
        cdqe                                            ; 001A _ 48: 98
; Note: Address is not rip-relative
        mov     rax, qword [abs sum_funcs+rax*8]        ; 001C _ 48: 8B. 04 C5, 00000000(d)
        mov     rdx, qword [rbp-20H]                    ; 0024 _ 48: 8B. 55, E0
        mov     rsi, qword [rbp-18H]                    ; 0028 _ 48: 8B. 75, E8
        mov     rcx, qword [rbp-10H]                    ; 002C _ 48: 8B. 4D, F0
        mov     rdi, rcx                                ; 0030 _ 48: 89. CF
        call    rax                                     ; 0033 _ FF. D0
        nop                                             ; 0035 _ 90
        leave                                           ; 0036 _ C9
        ret                                             ; 0037 _ C3
; sum_g End of function

foo:    ; Function begin
        push    rbp                                     ; 0038 _ 55
        mov     rbp, rsp                                ; 0039 _ 48: 89. E5
        sub     rsp, 32                                 ; 003C _ 48: 83. EC, 20
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        mov     rax, qword [fs:abs 28H]                 ; 0040 _ 64 48: 8B. 04 25, 00000028
        mov     qword [rbp-8H], rax                     ; 0049 _ 48: 89. 45, F8
        xor     eax, eax                                ; 004D _ 31. C0
        mov     dword [rbp-14H], 14                     ; 004F _ C7. 45, EC, 0000000E
        movss   xmm0, dword [rel ?_004]                 ; 0056 _ F3: 0F 10. 05, 00000000(rel)
        movss   dword [rbp-1CH], xmm0                   ; 005E _ F3: 0F 11. 45, E4
        movss   xmm0, dword [rel ?_005]                 ; 0063 _ F3: 0F 10. 05, 00000000(rel)
        movss   dword [rbp-18H], xmm0                   ; 006B _ F3: 0F 11. 45, E8
        lea     rcx, [rbp-18H]                          ; 0070 _ 48: 8D. 4D, E8
        lea     rdx, [rbp-1CH]                          ; 0074 _ 48: 8D. 55, E4
        lea     rsi, [rbp-10H]                          ; 0078 _ 48: 8D. 75, F0
        mov     eax, dword [rbp-14H]                    ; 007C _ 8B. 45, EC
        mov     edi, eax                                ; 007F _ 89. C7
        call    sum_g                                   ; 0081 _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0086 _ B8, 00000000
        mov     rdi, qword [rbp-8H]                     ; 008B _ 48: 8B. 7D, F8
; Note: Address is not rip-relative
; Note: Absolute memory address without relocation
        xor     rdi, qword [fs:abs 28H]                 ; 008F _ 64 48: 33. 3C 25, 00000028
        jz      ?_001                                   ; 0098 _ 74, 05
        call    __stack_chk_fail                        ; 009A _ E8, 00000000(rel)
?_001:  leave                                           ; 009F _ C9
        ret                                             ; 00A0 _ C3
; foo End of function

main:   ; Function begin
        push    rbp                                     ; 00A1 _ 55
        mov     rbp, rsp                                ; 00A2 _ 48: 89. E5
        sub     rsp, 16                                 ; 00A5 _ 48: 83. EC, 10
        mov     dword [rbp-4H], 0                       ; 00A9 _ C7. 45, FC, 00000000
        jmp     ?_003                                   ; 00B0 _ EB, 0E

?_002:  mov     eax, 0                                  ; 00B2 _ B8, 00000000
        call    foo                                     ; 00B7 _ E8, 00000000(rel)
        add     dword [rbp-4H], 1                       ; 00BC _ 83. 45, FC, 01
?_003:  mov     eax, 9999999                            ; 00C0 _ B8, 0098967F
        cmp     dword [rbp-4H], eax                     ; 00C5 _ 39. 45, FC
        jl      ?_002                                   ; 00C8 _ 7C, E8
        mov     eax, 0                                  ; 00CA _ B8, 00000000
        leave                                           ; 00CF _ C9
        ret                                             ; 00D0 _ C3
; main End of function


SECTION .data   align=32 noexecute                      ; section number 2, data

sum_funcs:                                              ; virtual table or function pointer
        dq sum_floats                                   ; 0000 _ 0000000000000000 (d)
        dq sum_ints                                     ; 0008 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0010 _ 0000000000000000 (d)
        dq sum_strings                                  ; 0018 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0020 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0028 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0030 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0038 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0040 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0048 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0050 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0058 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0060 _ 0000000000000000 (d)
        dq sum_floats                                   ; 0068 _ 0000000000000000 (d)


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=4 noexecute                       ; section number 4, const

veces:                                                  ; dword
        dd 0098967FH                                    ; 0000 _ 9999999 

?_004:  dd 41100000H                                    ; 0004 _ 9.0 

?_005:  dd 414028F6H                                    ; 0008 _ 12.01 


SECTION .eh_frame align=8 noexecute                     ; section number 5, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 0008 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd sum_g-$-20H                                  ; 0020 _ 00000000 (rel)
        dd 00000038H, 100E4100H                         ; 0024 _ 56 269369600 
        dd 0D430286H, 070C7306H                         ; 002C _ 222495366 118256390 
        dd 00000008H, 0000001CH                         ; 0034 _ 8 28 
        dd 0000003CH                                    ; 003C _ 60 
        dd sum_g-$-8H                                   ; 0040 _ 00000000 (rel)
        dd 00000069H, 100E4100H                         ; 0044 _ 105 269369600 
        dd 0D430286H, 0C640206H                         ; 004C _ 222495366 207880710 
        dd 00000807H, 0000001CH                         ; 0054 _ 2055 28 
        dd 0000005CH                                    ; 005C _ 92 
        dd sum_g-$+41H                                  ; 0060 _ 00000000 (rel)
        dd 00000030H, 100E4100H                         ; 0064 _ 48 269369600 
        dd 0D430286H, 070C6B06H                         ; 006C _ 222495366 118254342 
        dd 00000008H                                    ; 0074 _ 8 


