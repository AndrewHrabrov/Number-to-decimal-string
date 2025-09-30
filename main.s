%include "syscall.mac"

SECTION .bss
bf resb 32

SECTION .text
GLOBAL _start
EXTERN num2decstr

_start:
    mov eax, 1
    cpuid
  
    mov eax, ebx
    shr eax, 16
    and eax, 0xFF
    
    mov rdi, bf     
    mov rcx, 32      
    call num2decstr

    ; Вычисление длины строки
    mov rsi, rdi     
    mov rdx, bf     
    add rdx, rcx     
    sub rdx, rsi     
    WRITE rsi, rdx   
    
    WRITE newline, 1

    EXIT

SECTION .data
newline db 0xA


