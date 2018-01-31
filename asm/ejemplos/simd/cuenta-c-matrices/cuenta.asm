un_quinto: dw 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f, 0.2f
cuatro_quintos:dw 0.8f, 0.8f, 0.8f, 0.8f, 0.8f, 0.8f, 0.8f, 0.8f
uno_dos_tres_cuatro:dw 1234,1234,1234,1234,1234,1234,1234,1234
;; int16* cuenta (int16* A, int16* B, int16* C, unsigned N);
    
%define A xmm15
%define B xmm14
%define C xmm13
%define coefA xmm12
%define coefB xmm11
%define cmp_num xmm10
%define A_mem rbx
%define B_mem r12
%define C_mem r14
%define N r15
    
extern malloc
    
global cuenta
cuenta:

    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r14
    push r15
    movdqu cmp_num, [uno_dos_tres_cuatro]
    mov A_mem, rdi
    mov B_mem, rsi
    mov C_mem, rdx
    mov N, rcx
    xor rax, rax
    mov eax, ecx
    mul ecx
    call malloc
    
.ciclo:
    mov A, [A_mem]
    mov B, [B_mem]
    mov C, [C_mem]
    mov xmm1, C
    pcmpgtw xmm1, cmp_num
;; C > 1234 => x1 <- 1s
    mov coefA, cuatro_quintos
    pand coefA, xmm1
    pcmpeqw xmm2, xmm2
    pxor xmm1, xmm2
    mov xmm2, un_quinto
    pand xmm2, xmm1
    por coefA, xmm2
