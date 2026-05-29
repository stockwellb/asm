%include "syscalls.inc"

global _start

section .bss
        buffer resb 1

section .text
_start:
        mov rax, SYS_READ
        mov rdi, STDIN
        mov rsi, buffer
        mov rdx, 1
        syscall

        mov byte [buffer + 1], 10

        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, buffer
        mov rdx, 2
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall

