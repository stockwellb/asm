%include "syscalls.inc"
%include "print.asm"

global _start

section .data
greater_text db "a > b", 0
else_text db "a <= b", 0

section .text
_start:
        mov rax, -1 
        cmp rax, 5
        jg greater
        print_str else_text
        mov rdi, 0
        jmp exit


greater:
        print_str greater_text
        mov rdi, 1

exit:
        mov rax, SYS_EXIT
        syscall

