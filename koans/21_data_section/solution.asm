%include "syscalls.inc"

global _start

section .data
        msg: db "Hello World", 10
        msg_len: equ $ - msg

section .text
_start:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, msg
        mov rdx, msg_len
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall
