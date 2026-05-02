%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, 64
        shr rax, 2
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret
