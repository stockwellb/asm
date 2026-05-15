%include "syscalls.inc"
%include "print.asm"

global _start

section .data
        rbx_name db "rbx", 0

section .text
        _start:
        mov rbx, 0
print_loop:
        print_reg rbx_name, rbx
        cmp rbx, 5
        je end

        inc rbx
        jmp print_loop

end:
        mov rdi, rbx            ; exit code 5
        mov rax, SYS_EXIT
        syscall

