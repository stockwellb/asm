%include "syscalls.inc"

global _start

section .text
_start:
        mov rax, SYS_EXIT
        mov rsi, 0
        syscall
        ret
        
