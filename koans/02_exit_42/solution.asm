%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, SYS_EXIT
        mov rdi, 42
        syscall
        ret

