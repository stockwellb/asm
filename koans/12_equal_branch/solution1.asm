%include "syscalls.inc"

global _start

section .text
_start:

        mov rax, 10
        cmp rax, 10
        je equal_case
        mov rdi, 0

equal_case:
        mov rdi, 1
        mov rax, SYS_EXIT
        syscall
        ret

