;open source NASM x86-64 bit linux project by VoidPointerLover69
;names are weird bc i tested a lot in C, so i wouldnt get errors
;keep in mind i am fairly new to assembly so criticism is appreciated
;uses gnu c calling convention: rdi, rsi, rdx, rcx, r8, r9

section .text

global getstrl
global writestrl
global stoi
global strlength

writestrl: ;standard sys_write call
	mov rax, 1
	mov rdx, rsi
	mov rsi, rdi
	mov rdi, 1
	syscall
	ret

stoi: ;converts string to integer value
	xor rax, rax
	.top:
		movzx rsi, byte [rdi]
		inc rdi
		cmp rsi, 0x30
		jb .rett
		cmp rsi, 0x39
		ja .rett
		sub rsi, 0x30
		imul rax, 10
		add rax, rsi
		jmp .top
	.rett:
		ret	

getstrl: ;string input
	mov rax, 0
	mov rdx, rsi
	mov rsi, rdi
	mov rdi, 0
	syscall
	ret

strlength: ;string length
	mov rdx, 0
	dec rdi
	countsl:
		inc rdx
		inc rdi
		cmp byte[rdi], 0
		jnz countsl
	mov rax, rdx
	ret

