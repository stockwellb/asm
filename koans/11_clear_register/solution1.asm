%include "syscalls.inc"

global _start

section .text
_start:

        mov rax, 0
        mov rax, SYS_EXIT
        xor rdi, rdi
        syscall

