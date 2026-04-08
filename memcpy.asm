section .data
    source db "Hello", 10
    src_len equ $ - source

section .bss
    dest resb src_len

section .text
    global _start

_start:

    mov rsi, source
    mov rdi, dest
    mov rcx, src_len
    ;===============

copy_loop:
    mov al,[rsi]
    mov [rdi],al

    inc rdi
    inc rsi

    dec rcx
    jnz copy_loop

    mov rax,1
    mov rdi,1
    mov rsi,dest
    mov rdx ,src_len
    syscall
    jmp exit

exit:
 mov rax,60
 mov rdi ,0
 syscall
