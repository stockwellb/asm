%include "syscalls.inc"

global _start

section .data
        src: db "hello", 0
        src_len: equ $ - src - 1

section .bss
        dst: resb 6 


section .text
_start:
        xor rcx, rcx

loop:
        cmp byte [src + rcx], 0
        je done

        mov al, [src + rcx]
        mov [dst + rcx], al
        inc rcx
        jmp loop


done:
        mov byte [dst + 5], 10
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, dst
        mov rdx, src_len + 1
        syscall

        mov rax, SYS_EXIT
        mov rdi, 0
        syscall
