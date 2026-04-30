%include "syscalls.inc"

global _start

section .text

_start:
        mov rax, 1
        shl rax, 3
        mov rdi, rax
        mov rax, SYS_EXIT
        syscall
        ret
