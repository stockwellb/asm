%include "syscalls.inc"

global _start

section .text
_start:

        mov rax, 10
        cmp rax, 10
        je equal_case
        mov rdi, 0
        jmp exit

equal_case:
        mov rdi, 1

exit:
        mov rax, SYS_EXIT
        syscall

