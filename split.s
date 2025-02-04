	.file	"split.c"
	.intel_syntax noprefix
	.text
	.globl	parse
	.type	parse, @function
parse:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L4:
	add	QWORD PTR -24[rbp], 1
.L3:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 32
	je	.L4
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 34
	jne	.L13
	add	QWORD PTR -24[rbp], 1
	jmp	.L6
.L12:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 92
	jne	.L7
	add	QWORD PTR -24[rbp], 1
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 110
	je	.L8
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	jmp	.L10
.L8:
	mov	eax, 10
	jmp	.L10
.L7:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
.L10:
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	mov	rcx, rdx
	sal	rcx, 7
	mov	rdx, QWORD PTR -32[rbp]
	add	rcx, rdx
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	mov	BYTE PTR [rcx+rdx], al
	add	QWORD PTR -24[rbp], 1
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 34
	je	.L11
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L12
	jmp	.L11
.L14:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	mov	rcx, rdx
	sal	rcx, 7
	mov	rdx, QWORD PTR -32[rbp]
	lea	rsi, [rcx+rdx]
	mov	edx, DWORD PTR -4[rbp]
	lea	ecx, 1[rdx]
	mov	DWORD PTR -4[rbp], ecx
	movzx	ecx, BYTE PTR [rax]
	movsx	rax, edx
	mov	BYTE PTR [rsi+rax], cl
.L13:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L11
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 32
	jne	.L14
.L11:
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	cdqe
	sal	rax, 7
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	add	rdx, rax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	BYTE PTR [rdx+rax], 0
	add	QWORD PTR -24[rbp], 1
	mov	DWORD PTR -4[rbp], 0
.L2:
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L15
	cmp	DWORD PTR -8[rbp], 31
	jg	.L15
	cmp	DWORD PTR -4[rbp], 127
	jle	.L3
.L15:
	mov	eax, DWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	parse, .-parse
	.section	.rodata
.LC0:
	.string	"./test the \"real path\""
.LC1:
	.string	"ARGC=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 32
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -4112[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	parse
	mov	DWORD PTR -4116[rbp], eax
	mov	eax, DWORD PTR -4116[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4120[rbp], 0
	jmp	.L19
.L20:
	lea	rdx, -4112[rbp]
	mov	eax, DWORD PTR -4120[rbp]
	cdqe
	sal	rax, 7
	add	rax, rdx
	mov	rdi, rax
	call	puts@PLT
	add	DWORD PTR -4120[rbp], 1
.L19:
	mov	eax, DWORD PTR -4120[rbp]
	cmp	eax, DWORD PTR -4116[rbp]
	jl	.L20
	nop
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
