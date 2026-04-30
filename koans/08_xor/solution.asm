%include "syscalls.inc"
global _start

section .text
_start:
        mov rax, 0xAA   ; 1010 1010
        mov rbx, 0x55   ; 0101 0101
        xor rax, rbx    ; 1111 1111
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret
