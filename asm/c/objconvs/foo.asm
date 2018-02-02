; Disassembly of file: foo.o
; Fri Feb  2 18:23:26 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global x
global y


SECTION .text   align=1 execute                         ; section number 1, code


SECTION .data   align=4 noexecute                       ; section number 2, data

x:                                                      ; dword
        dd 00000001H                                    ; 0000 _ 1 

y:      dd 00000002H                                    ; 0004 _ 2 


SECTION .bss    align=1 noexecute                       ; section number 3, bss


