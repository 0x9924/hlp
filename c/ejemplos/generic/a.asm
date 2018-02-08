; Disassembly of file: a.out
; Wed Feb  7 18:35:29 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global _end
global _init: function
global _start: function
global mind: function
global mini: function
global print_int: function
global print_double: function
global print_default: function
global main: function
global __libc_csu_init: function
global __libc_csu_fini: function
global _fini: function
global _IO_stdin_used
global __data_start
global data_start                                       ; Note: Weak.
global __dso_handle
global __TMC_END__
global __bss_start
global _edata

extern _ITM_registerTMCloneTable                        ; byte
extern _Jv_RegisterClasses                              ; byte
extern __gmon_start__                                   ; byte
extern __libc_start_main@@GLIBC_2.2.5                   ; near
extern printf@@GLIBC_2.2.5                              ; near
extern _ITM_deregisterTMCloneTable                      ; byte
extern __gmon_start__                                   ; near
extern __libc_start_main                                ; near
extern printf                                           ; near


SECTION .interp align=1 noexecute                       ; section number 1, const

        db 2FH, 6CH, 69H, 62H, 36H, 34H, 2FH, 6CH       ; 00400238 _ /lib64/l
        db 64H, 2DH, 6CH, 69H, 6EH, 75H, 78H, 2DH       ; 00400240 _ d-linux-
        db 78H, 38H, 36H, 2DH, 36H, 34H, 2EH, 73H       ; 00400248 _ x86-64.s
        db 6FH, 2EH, 32H, 00H                           ; 00400250 _ o.2.


SECTION .note.ABI-tag align=4 noexecute                 ; section number 2, const

        db 04H, 00H, 00H, 00H, 10H, 00H, 00H, 00H       ; 00400254 _ ........
        db 01H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0040025C _ ....GNU.
        db 00H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 00400264 _ ........
        db 06H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 0040026C _ .... ...


SECTION .note.gnu.build-id align=4 noexecute            ; section number 3, const

        db 04H, 00H, 00H, 00H, 14H, 00H, 00H, 00H       ; 00400274 _ ........
        db 03H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H       ; 0040027C _ ....GNU.
        db 93H, 0D4H, 1AH, 60H, 0D9H, 97H, 6DH, 0C4H    ; 00400284 _ ...`..m.
        db 0EAH, 0FDH, 0ADH, 0D3H, 59H, 0BEH, 0DDH, 0D4H; 0040028C _ ....Y...
        db 72H, 0E1H, 30H, 0D3H                         ; 00400294 _ r.0.


SECTION .gnu.hash align=8 noexecute                     ; section number 4, const

        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 00400298 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002A8 _ ........
        db 00H, 00H, 00H, 00H                           ; 004002B0 _ ....


SECTION .dynsym align=8 noexecute                       ; section number 5, const

        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002C8 _ ........
        db 0BH, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004002D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002D8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002E0 _ ........
        db 12H, 00H, 00H, 00H, 12H, 00H, 00H, 00H       ; 004002E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004002F8 _ ........
        db 24H, 00H, 00H, 00H, 20H, 00H, 00H, 00H       ; 00400300 _ $... ...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400308 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400310 _ ........


SECTION .dynstr align=1 noexecute                       ; section number 6, const

        db 00H, 6CH, 69H, 62H, 63H, 2EH, 73H, 6FH       ; 00400318 _ .libc.so
        db 2EH, 36H, 00H, 70H, 72H, 69H, 6EH, 74H       ; 00400320 _ .6.print
        db 66H, 00H, 5FH, 5FH, 6CH, 69H, 62H, 63H       ; 00400328 _ f.__libc
        db 5FH, 73H, 74H, 61H, 72H, 74H, 5FH, 6DH       ; 00400330 _ _start_m
        db 61H, 69H, 6EH, 00H, 5FH, 5FH, 67H, 6DH       ; 00400338 _ ain.__gm
        db 6FH, 6EH, 5FH, 73H, 74H, 61H, 72H, 74H       ; 00400340 _ on_start
        db 5FH, 5FH, 00H, 47H, 4CH, 49H, 42H, 43H       ; 00400348 _ __.GLIBC
        db 5FH, 32H, 2EH, 32H, 2EH, 35H, 00H            ; 00400350 _ _2.2.5.


SECTION .gnu.version align=2 noexecute                  ; section number 7, const

        db 00H, 00H, 02H, 00H, 02H, 00H, 00H, 00H       ; 00400358 _ ........


SECTION .gnu.version_r align=8 noexecute                ; section number 8, const

        db 01H, 00H, 01H, 00H, 01H, 00H, 00H, 00H       ; 00400360 _ ........
        db 10H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400368 _ ........
        db 75H, 1AH, 69H, 09H, 00H, 00H, 02H, 00H       ; 00400370 _ u.i.....
        db 33H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400378 _ 3.......


SECTION .rela.dyn align=8 noexecute                     ; section number 9, const

        db 0F8H, 0FH, 60H, 00H, 00H, 00H, 00H, 00H      ; 00400380 _ ..`.....
        db 06H, 00H, 00H, 00H, 03H, 00H, 00H, 00H       ; 00400388 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400390 _ ........


SECTION .rela.plt align=8 noexecute                     ; section number 10, const

        db 18H, 10H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00400398 _ ..`.....
        db 07H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 004003A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003A8 _ ........
        db 20H, 10H, 60H, 00H, 00H, 00H, 00H, 00H       ; 004003B0 _  .`.....
        db 07H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 004003B8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 004003C0 _ ........


SECTION .init   align=4 execute                         ; section number 11, code

_init:  ; Function begin
        sub     rsp, 8                                  ; 004003C8 _ 48: 83. EC, 08
        mov     rax, qword [rel ?_020]                  ; 004003CC _ 48: 8B. 05, 00200C25(rel)
        test    rax, rax                                ; 004003D3 _ 48: 85. C0
        jz      ?_001                                   ; 004003D6 _ 74, 05
        call    ?_007                                   ; 004003D8 _ E8, 00000043(rel)
?_001:  add     rsp, 8                                  ; 004003DD _ 48: 83. C4, 08
        ret                                             ; 004003E1 _ C3
; _init End of function


SECTION .plt    align=16 execute                        ; section number 12, code

?_002:  push    qword [rel ?_021]                       ; 004003F0 _ FF. 35, 00200C12(rel)
        jmp     near [rel ?_022]                        ; 004003F6 _ FF. 25, 00200C14(rel)

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_003:  jmp     near [rel ?_023]                        ; 00400400 _ FF. 25, 00200C12(rel)

?_004:
; Note: Immediate operand could be made smaller by sign extension
        push    0                                       ; 00400406 _ 68, 00000000
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040040B _ E9, FFFFFFE0

?_005:  jmp     near [rel ?_024]                        ; 00400410 _ FF. 25, 00200C0A(rel)

?_006:  ; Local function
; Note: Immediate operand could be made smaller by sign extension
        push    1                                       ; 00400416 _ 68, 00000001
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_002                                   ; 0040041B _ E9, FFFFFFD0


SECTION .plt.got align=8 execute                        ; section number 13, code

?_007:  ; Local function
        jmp     near [rel ?_020]                        ; 00400420 _ FF. 25, 00200BD2(rel)

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8


SECTION .text   align=16 execute                        ; section number 14, code

_start: ; Function begin
        xor     ebp, ebp                                ; 00400430 _ 31. ED
        mov     r9, rdx                                 ; 00400432 _ 49: 89. D1
        pop     rsi                                     ; 00400435 _ 5E
        mov     rdx, rsp                                ; 00400436 _ 48: 89. E2
        and     rsp, 0FFFFFFFFFFFFFFF0H                 ; 00400439 _ 48: 83. E4, F0
        push    rax                                     ; 0040043D _ 50
        push    rsp                                     ; 0040043E _ 54
        mov     r8, 4195952                             ; 0040043F _ 49: C7. C0, 00400670
        mov     rcx, 4195840                            ; 00400446 _ 48: C7. C1, 00400600
        mov     rdi, 4195796                            ; 0040044D _ 48: C7. C7, 004005D4
        call    ?_005                                   ; 00400454 _ E8, FFFFFFB7(rel)
        hlt                                             ; 00400459 _ F4
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
deregister_tm_clones:
        mov     eax, ?_025                              ; 00400460 _ B8, 0060103F(d)
        push    rbp                                     ; 00400465 _ 55
        sub     rax, 6295608                            ; 00400466 _ 48: 2D, 00601038
        cmp     rax, 14                                 ; 0040046C _ 48: 83. F8, 0E
        mov     rbp, rsp                                ; 00400470 _ 48: 89. E5
        jbe     ?_008                                   ; 00400473 _ 76, 1B
        mov     eax, 0                                  ; 00400475 _ B8, 00000000
        test    rax, rax                                ; 0040047A _ 48: 85. C0
        jz      ?_008                                   ; 0040047D _ 74, 11
        pop     rbp                                     ; 0040047F _ 5D
        mov     edi, _edata                             ; 00400480 _ BF, 00601038(d)
        jmp     rax                                     ; 00400485 _ FF. E0

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_008:  pop     rbp                                     ; 00400490 _ 5D
        ret                                             ; 00400491 _ C3
; _start End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

register_tm_clones:; Local function
        mov     esi, _edata                             ; 004004A0 _ BE, 00601038(d)
        push    rbp                                     ; 004004A5 _ 55
        sub     rsi, 6295608                            ; 004004A6 _ 48: 81. EE, 00601038
        sar     rsi, 3                                  ; 004004AD _ 48: C1. FE, 03
        mov     rbp, rsp                                ; 004004B1 _ 48: 89. E5
        mov     rax, rsi                                ; 004004B4 _ 48: 89. F0
        shr     rax, 63                                 ; 004004B7 _ 48: C1. E8, 3F
        add     rsi, rax                                ; 004004BB _ 48: 01. C6
        sar     rsi, 1                                  ; 004004BE _ 48: D1. FE
        jz      ?_009                                   ; 004004C1 _ 74, 15
        mov     eax, 0                                  ; 004004C3 _ B8, 00000000
        test    rax, rax                                ; 004004C8 _ 48: 85. C0
        jz      ?_009                                   ; 004004CB _ 74, 0B
        pop     rbp                                     ; 004004CD _ 5D
        mov     edi, _edata                             ; 004004CE _ BF, 00601038(d)
        jmp     rax                                     ; 004004D3 _ FF. E0

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_009:  pop     rbp                                     ; 004004D8 _ 5D
        ret                                             ; 004004D9 _ C3

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

__do_global_dtors_aux:; Local function
        cmp     byte [rel _edata], 0                    ; 004004E0 _ 80. 3D, 00200B51(rel), 00
        jnz     ?_010                                   ; 004004E7 _ 75, 11
        push    rbp                                     ; 004004E9 _ 55
        mov     rbp, rsp                                ; 004004EA _ 48: 89. E5
        call    deregister_tm_clones                    ; 004004ED _ E8, FFFFFF6E
        pop     rbp                                     ; 004004F2 _ 5D
        mov     byte [rel _edata], 1                    ; 004004F3 _ C6. 05, 00200B3E(rel), 01
?_010:  DB      0F3H                                    ; Prefix coded explicitly
        ret                                             ; 004004FA _ F3: C3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

frame_dummy:; Local function
        mov     edi, __JCR_LIST__                       ; 00400500 _ BF, 00600E20(d)
        cmp     qword [rdi], 0                          ; 00400505 _ 48: 83. 3F, 00
        jnz     ?_012                                   ; 00400509 _ 75, 05
?_011:  jmp     register_tm_clones                      ; 0040050B _ EB, 93

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_012:  mov     eax, 0                                  ; 00400510 _ B8, 00000000
        test    rax, rax                                ; 00400515 _ 48: 85. C0
        jz      ?_011                                   ; 00400518 _ 74, F1
        push    rbp                                     ; 0040051A _ 55
        mov     rbp, rsp                                ; 0040051B _ 48: 89. E5
        call    rax                                     ; 0040051E _ FF. D0
        pop     rbp                                     ; 00400520 _ 5D
        jmp     register_tm_clones                      ; 00400521 _ E9, FFFFFF7A

mind:   ; Function begin
        push    rbp                                     ; 00400526 _ 55
        mov     rbp, rsp                                ; 00400527 _ 48: 89. E5
        movsd   qword [rbp-8H], xmm0                    ; 0040052A _ F2: 0F 11. 45, F8
        movsd   qword [rbp-10H], xmm1                   ; 0040052F _ F2: 0F 11. 4D, F0
        movsd   xmm0, qword [rbp-10H]                   ; 00400534 _ F2: 0F 10. 45, F0
        ucomisd xmm0, qword [rbp-8H]                    ; 00400539 _ 66: 0F 2E. 45, F8
        jbe     ?_013                                   ; 0040053E _ 76, 07
        movsd   xmm0, qword [rbp-8H]                    ; 00400540 _ F2: 0F 10. 45, F8
        jmp     ?_014                                   ; 00400545 _ EB, 05

?_013:  movsd   xmm0, qword [rbp-10H]                   ; 00400547 _ F2: 0F 10. 45, F0
?_014:  pop     rbp                                     ; 0040054C _ 5D
        ret                                             ; 0040054D _ C3
; mind End of function

mini:   ; Function begin
        push    rbp                                     ; 0040054E _ 55
        mov     rbp, rsp                                ; 0040054F _ 48: 89. E5
        mov     dword [rbp-4H], edi                     ; 00400552 _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 00400555 _ 89. 75, F8
        mov     eax, dword [rbp-4H]                     ; 00400558 _ 8B. 45, FC
        cmp     dword [rbp-8H], eax                     ; 0040055B _ 39. 45, F8
        cmovle  eax, dword [rbp-8H]                     ; 0040055E _ 0F 4E. 45, F8
        pop     rbp                                     ; 00400562 _ 5D
        ret                                             ; 00400563 _ C3
; mini End of function

print_int:; Function begin
        push    rbp                                     ; 00400564 _ 55
        mov     rbp, rsp                                ; 00400565 _ 48: 89. E5
        sub     rsp, 16                                 ; 00400568 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 0040056C _ 89. 7D, FC
        mov     eax, dword [rbp-4H]                     ; 0040056F _ 8B. 45, FC
        mov     esi, eax                                ; 00400572 _ 89. C6
        mov     edi, ?_017                              ; 00400574 _ BF, 00400684(d)
        mov     eax, 0                                  ; 00400579 _ B8, 00000000
        call    ?_003                                   ; 0040057E _ E8, FFFFFE7D(rel)
        nop                                             ; 00400583 _ 90
        leave                                           ; 00400584 _ C9
        ret                                             ; 00400585 _ C3
; print_int End of function

print_double:; Function begin
        push    rbp                                     ; 00400586 _ 55
        mov     rbp, rsp                                ; 00400587 _ 48: 89. E5
        sub     rsp, 16                                 ; 0040058A _ 48: 83. EC, 10
        movsd   qword [rbp-8H], xmm0                    ; 0040058E _ F2: 0F 11. 45, F8
        mov     rax, qword [rbp-8H]                     ; 00400593 _ 48: 8B. 45, F8
        mov     qword [rbp-10H], rax                    ; 00400597 _ 48: 89. 45, F0
        movsd   xmm0, qword [rbp-10H]                   ; 0040059B _ F2: 0F 10. 45, F0
        mov     edi, ?_018                              ; 004005A0 _ BF, 0040068D(d)
        mov     eax, 1                                  ; 004005A5 _ B8, 00000001
        call    ?_003                                   ; 004005AA _ E8, FFFFFE51(rel)
        nop                                             ; 004005AF _ 90
        leave                                           ; 004005B0 _ C9
        ret                                             ; 004005B1 _ C3
; print_double End of function

print_default:; Function begin
        push    rbp                                     ; 004005B2 _ 55
        mov     rbp, rsp                                ; 004005B3 _ 48: 89. E5
        sub     rsp, 16                                 ; 004005B6 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 004005BA _ 89. 7D, FC
        mov     eax, dword [rbp-4H]                     ; 004005BD _ 8B. 45, FC
        mov     esi, eax                                ; 004005C0 _ 89. C6
        mov     edi, ?_019                              ; 004005C2 _ BF, 00400696(d)
        mov     eax, 0                                  ; 004005C7 _ B8, 00000000
        call    ?_003                                   ; 004005CC _ E8, FFFFFE2F(rel)
        nop                                             ; 004005D1 _ 90
        leave                                           ; 004005D2 _ C9
        ret                                             ; 004005D3 _ C3
; print_default End of function

main:   ; Function begin
        push    rbp                                     ; 004005D4 _ 55
        mov     rbp, rsp                                ; 004005D5 _ 48: 89. E5
        mov     esi, 33                                 ; 004005D8 _ BE, 00000021
        mov     edi, 22                                 ; 004005DD _ BF, 00000016
        call    mini                                    ; 004005E2 _ E8, FFFFFF67
        mov     edi, eax                                ; 004005E7 _ 89. C7
        call    print_int                               ; 004005E9 _ E8, FFFFFF76
        mov     eax, 0                                  ; 004005EE _ B8, 00000000
        pop     rbp                                     ; 004005F3 _ 5D
        ret                                             ; 004005F4 _ C3
; main End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H, 90H

ALIGN   16

__libc_csu_init:; Function begin
        push    r15                                     ; 00400600 _ 41: 57
        push    r14                                     ; 00400602 _ 41: 56
        mov     r15d, edi                               ; 00400604 _ 41: 89. FF
        push    r13                                     ; 00400607 _ 41: 55
        push    r12                                     ; 00400609 _ 41: 54
        lea     r12, [rel __frame_dummy_init_array_entry]; 0040060B _ 4C: 8D. 25, 002007FE(rel)
        push    rbp                                     ; 00400612 _ 55
        lea     rbp, [rel __do_global_dtors_aux_fini_array_entry]; 00400613 _ 48: 8D. 2D, 002007FE(rel)
        push    rbx                                     ; 0040061A _ 53
        mov     r14, rsi                                ; 0040061B _ 49: 89. F6
        mov     r13, rdx                                ; 0040061E _ 49: 89. D5
        sub     rbp, r12                                ; 00400621 _ 4C: 29. E5
        sub     rsp, 8                                  ; 00400624 _ 48: 83. EC, 08
        sar     rbp, 3                                  ; 00400628 _ 48: C1. FD, 03
        call    _init                                   ; 0040062C _ E8, FFFFFD97(rel)
        test    rbp, rbp                                ; 00400631 _ 48: 85. ED
        jz      ?_016                                   ; 00400634 _ 74, 20
        xor     ebx, ebx                                ; 00400636 _ 31. DB
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_015:  mov     rdx, r13                                ; 00400640 _ 4C: 89. EA
        mov     rsi, r14                                ; 00400643 _ 4C: 89. F6
        mov     edi, r15d                               ; 00400646 _ 44: 89. FF
        call    near [r12+rbx*8]                        ; 00400649 _ 41: FF. 14 DC
        add     rbx, 1                                  ; 0040064D _ 48: 83. C3, 01
        cmp     rbx, rbp                                ; 00400651 _ 48: 39. EB
        jnz     ?_015                                   ; 00400654 _ 75, EA
?_016:  add     rsp, 8                                  ; 00400656 _ 48: 83. C4, 08
        pop     rbx                                     ; 0040065A _ 5B
        pop     rbp                                     ; 0040065B _ 5D
        pop     r12                                     ; 0040065C _ 41: 5C
        pop     r13                                     ; 0040065E _ 41: 5D
        pop     r14                                     ; 00400660 _ 41: 5E
        pop     r15                                     ; 00400662 _ 41: 5F
        ret                                             ; 00400664 _ C3
; __libc_csu_init End of function

        nop                                             ; 00400665 _ 90
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

__libc_csu_fini:; Function begin
        DB      0F3H                                    ; Prefix coded explicitly
        ret                                             ; 00400670 _ F3: C3
; __libc_csu_fini End of function


SECTION .fini   align=4 execute                         ; section number 15, code

_fini:  ; Function begin
        sub     rsp, 8                                  ; 00400674 _ 48: 83. EC, 08
        add     rsp, 8                                  ; 00400678 _ 48: 83. C4, 08
        ret                                             ; 0040067C _ C3
; _fini End of function


SECTION .rodata align=4 noexecute                       ; section number 16, const

_IO_stdin_used:                                         ; dword
        dd 00020001H                                    ; 00400680 _ 131073 

?_017:                                                  ; byte
        db 6DH, 69H, 6EH, 3AH, 20H, 25H, 64H, 0AH       ; 00400684 _ min: %d.
        db 00H                                          ; 0040068C _ .

?_018:                                                  ; byte
        db 6DH, 69H, 6EH, 3AH, 20H, 25H, 66H, 0AH       ; 0040068D _ min: %f.
        db 00H                                          ; 00400695 _ .

?_019:                                                  ; byte
        db 6DH, 69H, 6EH, 3AH, 20H, 25H, 78H, 0AH       ; 00400696 _ min: %x.
        db 00H                                          ; 0040069E _ .


SECTION .eh_frame_hdr align=4 noexecute                 ; section number 17, const

__GNU_EH_FRAME_HDR:                                     ; byte
        db 01H, 1BH, 03H, 3BH, 5CH, 00H, 00H, 00H       ; 004006A0 _ ...;\...
        db 0AH, 00H, 00H, 00H, 50H, 0FDH, 0FFH, 0FFH    ; 004006A8 _ ....P...
        db 0A8H, 00H, 00H, 00H, 90H, 0FDH, 0FFH, 0FFH   ; 004006B0 _ ........
        db 78H, 00H, 00H, 00H, 86H, 0FEH, 0FFH, 0FFH    ; 004006B8 _ x.......
        db 0D0H, 00H, 00H, 00H, 0AEH, 0FEH, 0FFH, 0FFH  ; 004006C0 _ ........
        db 0F0H, 00H, 00H, 00H, 0C4H, 0FEH, 0FFH, 0FFH  ; 004006C8 _ ........
        db 10H, 01H, 00H, 00H, 0E6H, 0FEH, 0FFH, 0FFH   ; 004006D0 _ ........
        db 30H, 01H, 00H, 00H, 12H, 0FFH, 0FFH, 0FFH    ; 004006D8 _ 0.......
        db 50H, 01H, 00H, 00H, 34H, 0FFH, 0FFH, 0FFH    ; 004006E0 _ P...4...
        db 70H, 01H, 00H, 00H, 60H, 0FFH, 0FFH, 0FFH    ; 004006E8 _ p...`...
        db 90H, 01H, 00H, 00H, 0D0H, 0FFH, 0FFH, 0FFH   ; 004006F0 _ ........
        db 0D8H, 01H, 00H, 00H                          ; 004006F8 _ ....


SECTION .eh_frame align=8 noexecute                     ; section number 18, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400700 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00400708 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 07H, 10H       ; 00400710 _ ........
        db 14H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00400718 _ ........
        db 10H, 0FDH, 0FFH, 0FFH, 2AH, 00H, 00H, 00H    ; 00400720 _ ....*...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400728 _ ........
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400730 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 78H, 10H, 01H       ; 00400738 _ .zR..x..
        db 1BH, 0CH, 07H, 08H, 90H, 01H, 00H, 00H       ; 00400740 _ ........
        db 24H, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 00400748 _ $.......
        db 0A0H, 0FCH, 0FFH, 0FFH, 30H, 00H, 00H, 00H   ; 00400750 _ ....0...
        db 00H, 0EH, 10H, 46H, 0EH, 18H, 4AH, 0FH       ; 00400758 _ ...F..J.
        db 0BH, 77H, 08H, 80H, 00H, 3FH, 1AH, 3BH       ; 00400760 _ .w...?.;
        db 2AH, 33H, 24H, 22H, 00H, 00H, 00H, 00H       ; 00400768 _ *3$"....
        db 1CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 00400770 _ ....D...
        db 0AEH, 0FDH, 0FFH, 0FFH, 28H, 00H, 00H, 00H   ; 00400778 _ ....(...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00400780 _ .A....C.
        db 06H, 63H, 0CH, 07H, 08H, 00H, 00H, 00H       ; 00400788 _ .c......
        db 1CH, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 00400790 _ ....d...
        db 0B6H, 0FDH, 0FFH, 0FFH, 16H, 00H, 00H, 00H   ; 00400798 _ ........
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004007A0 _ .A....C.
        db 06H, 51H, 0CH, 07H, 08H, 00H, 00H, 00H       ; 004007A8 _ .Q......
        db 1CH, 00H, 00H, 00H, 84H, 00H, 00H, 00H       ; 004007B0 _ ........
        db 0ACH, 0FDH, 0FFH, 0FFH, 22H, 00H, 00H, 00H   ; 004007B8 _ ...."...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004007C0 _ .A....C.
        db 06H, 5DH, 0CH, 07H, 08H, 00H, 00H, 00H       ; 004007C8 _ .]......
        db 1CH, 00H, 00H, 00H, 0A4H, 00H, 00H, 00H      ; 004007D0 _ ........
        db 0AEH, 0FDH, 0FFH, 0FFH, 2CH, 00H, 00H, 00H   ; 004007D8 _ ....,...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 004007E0 _ .A....C.
        db 06H, 67H, 0CH, 07H, 08H, 00H, 00H, 00H       ; 004007E8 _ .g......
        db 1CH, 00H, 00H, 00H, 0C4H, 00H, 00H, 00H      ; 004007F0 _ ........
        db 0BAH, 0FDH, 0FFH, 0FFH, 22H, 00H, 00H, 00H   ; 004007F8 _ ...."...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00400800 _ .A....C.
        db 06H, 5DH, 0CH, 07H, 08H, 00H, 00H, 00H       ; 00400808 _ .]......
        db 1CH, 00H, 00H, 00H, 0E4H, 00H, 00H, 00H      ; 00400810 _ ........
        db 0BCH, 0FDH, 0FFH, 0FFH, 21H, 00H, 00H, 00H   ; 00400818 _ ....!...
        db 00H, 41H, 0EH, 10H, 86H, 02H, 43H, 0DH       ; 00400820 _ .A....C.
        db 06H, 5CH, 0CH, 07H, 08H, 00H, 00H, 00H       ; 00400828 _ .\......
        db 44H, 00H, 00H, 00H, 04H, 01H, 00H, 00H       ; 00400830 _ D.......
        db 0C8H, 0FDH, 0FFH, 0FFH, 65H, 00H, 00H, 00H   ; 00400838 _ ....e...
        db 00H, 42H, 0EH, 10H, 8FH, 02H, 42H, 0EH       ; 00400840 _ .B....B.
        db 18H, 8EH, 03H, 45H, 0EH, 20H, 8DH, 04H       ; 00400848 _ ...E. ..
        db 42H, 0EH, 28H, 8CH, 05H, 48H, 0EH, 30H       ; 00400850 _ B.(..H.0
        db 86H, 06H, 48H, 0EH, 38H, 83H, 07H, 4DH       ; 00400858 _ ..H.8..M
        db 0EH, 40H, 72H, 0EH, 38H, 41H, 0EH, 30H       ; 00400860 _ .@r.8A.0
        db 41H, 0EH, 28H, 42H, 0EH, 20H, 42H, 0EH       ; 00400868 _ A.(B. B.
        db 18H, 42H, 0EH, 10H, 42H, 0EH, 08H, 00H       ; 00400870 _ .B..B...
        db 14H, 00H, 00H, 00H, 4CH, 01H, 00H, 00H       ; 00400878 _ ....L...
        db 0F0H, 0FDH, 0FFH, 0FFH, 02H, 00H, 00H, 00H   ; 00400880 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00400888 _ ........

__FRAME_END__:                                          ; byte
        db 00H, 00H, 00H, 00H                           ; 00400890 _ ....


SECTION .init_array align=8 noexecute                   ; section number 19, data

__init_array_start:                                     ; qword
__frame_dummy_init_array_entry:                         ; virtual table or function pointer
        dq frame_dummy                                  ; 00600E10 _ 0000000000400500 (d)


SECTION .fini_array align=8 noexecute                   ; section number 20, data

__init_array_end:                                       ; byte
__do_global_dtors_aux_fini_array_entry:                 ; byte
        db 0E0H, 04H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00600E18 _ ..@.....


SECTION .jcr    align=8 noexecute                       ; section number 21, data

__JCR_END__:                                            ; byte
__JCR_LIST__:                                           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E20 _ ........


SECTION .dynamic align=8 noexecute                      ; section number 22, data

_DYNAMIC:                                               ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E28 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E30 _ ........
        db 0CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E38 _ ........
        db 0C8H, 03H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00600E40 _ ..@.....
        db 0DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E48 _ ........
        db 74H, 06H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600E50 _ t.@.....
        db 19H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E58 _ ........
        db 10H, 0EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00600E60 _ ..`.....
        db 1BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E68 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E70 _ ........
        db 1AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E78 _ ........
        db 18H, 0EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00600E80 _ ..`.....
        db 1CH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E88 _ ........
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600E90 _ ........
        db 0F5H, 0FEH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00600E98 _ ...o....
        db 98H, 02H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600EA0 _ ..@.....
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EA8 _ ........
        db 18H, 03H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600EB0 _ ..@.....
        db 06H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EB8 _ ........
        db 0B8H, 02H, 40H, 00H, 00H, 00H, 00H, 00H      ; 00600EC0 _ ..@.....
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EC8 _ ........
        db 3FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600ED0 _ ?.......
        db 0BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600ED8 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EE0 _ ........
        db 15H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EE8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EF0 _ ........
        db 03H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600EF8 _ ........
        db 00H, 10H, 60H, 00H, 00H, 00H, 00H, 00H       ; 00600F00 _ ..`.....
        db 02H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F08 _ ........
        db 30H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F10 _ 0.......
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F18 _ ........
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F20 _ ........
        db 17H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F28 _ ........
        db 98H, 03H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600F30 _ ..@.....
        db 07H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F38 _ ........
        db 80H, 03H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600F40 _ ..@.....
        db 08H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F48 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F50 _ ........
        db 09H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F58 _ ........
        db 18H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F60 _ ........
        db 0FEH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00600F68 _ ...o....
        db 60H, 03H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600F70 _ `.@.....
        db 0FFH, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00600F78 _ ...o....
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F80 _ ........
        db 0F0H, 0FFH, 0FFH, 6FH, 00H, 00H, 00H, 00H    ; 00600F88 _ ...o....
        db 58H, 03H, 40H, 00H, 00H, 00H, 00H, 00H       ; 00600F90 _ X.@.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600F98 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FA0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FA8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FB0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FB8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FC0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FC8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FD0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FD8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FE0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FE8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00600FF0 _ ........


SECTION .got    align=8 noexecute                       ; section number 23, data

?_020:                                                  ; switch/case jump table
        dd __gmon_start__                               ; 00600FF8 _ 00000000 (GOT)
        dd 00000000H                                    ; 00600FFC _ 00000000 


SECTION .got.plt align=8 noexecute                      ; section number 24, data

_GLOBAL_OFFSET_TABLE_:                                  ; byte
        db 28H, 0EH, 60H, 00H, 00H, 00H, 00H, 00H       ; 00601000 _ (.`.....

?_021:                                                  ; qword
        dq 0000000000000000H                            ; 00601008 _ 0000000000000000 

?_022:                                                  ; switch/case jump table
        dq 0000000000000000H                            ; 00601010 _ 0000000000000000 

?_023:                                                  ; switch/case jump table
        dq ?_004                                        ; 00601018 _ 0000000000400406 (d)

?_024:                                                  ; switch/case jump table
        dq ?_006                                        ; 00601020 _ 0000000000400416 (d)


SECTION .data   align=8 noexecute                       ; section number 25, data

__data_start:                                           ; byte
data_start:                                             ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00601028 _ ........

__dso_handle:                                           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00601030 _ ........


SECTION .bss    align=1 noexecute                       ; section number 26, bss

__TMC_END__:                                            ; byte
__bss_start:                                            ; byte
_edata:                                                 ; byte
completed.7585:                                         ; byte
        resb    7                                       ; 00601038

?_025:                                                  ; byte
        resb    1                                       ; 0060103F


