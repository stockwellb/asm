%include "syscalls.inc"

global _start

section .data
        msg: db "hi", 10

section .text
_start:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, msg
        mov rdx, 3
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall



