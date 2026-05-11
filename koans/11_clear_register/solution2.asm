%include "syscalls.inc"

global _start

section .text
_start:
        xor eax, eax
        mov rax, SYS_EXIT
        xor rdi, rdi
        syscall

