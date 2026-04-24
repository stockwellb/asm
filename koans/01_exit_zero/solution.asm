global _start

section .data
        SYS_EXIT equ 60

section .text
_start:
        mov rax, SYS_EXIT
        mov rsi, 0
        syscall
        ret
        
