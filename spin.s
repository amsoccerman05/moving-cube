	.file	"spin.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	A
	.bss
	.align 4
A:
	.space 4
	.globl	B
	.align 4
B:
	.space 4
	.globl	C
	.align 4
C:
	.space 4
	.globl	cubeWidth
	.data
	.align 4
cubeWidth:
	.long	1092616192
	.globl	width
	.align 4
width:
	.long	160
	.globl	height
	.align 4
height:
	.long	44
	.globl	zBuffer
	.bss
	.align 32
zBuffer:
	.space 28160
	.globl	buffer
	.align 32
buffer:
	.space 7040
	.globl	backgroundASCIICode
	.data
	.align 4
backgroundASCIICode:
	.long	32
	.globl	distanceFromCam
	.align 4
distanceFromCam:
	.long	100
	.globl	K1
	.align 4
K1:
	.long	1109393408
	.globl	incrementSpeed
	.align 4
incrementSpeed:
	.long	1058642330
	.globl	x
	.bss
	.align 4
x:
	.space 4
	.globl	y
	.align 4
y:
	.space 4
	.globl	z
	.align 4
z:
	.space 4
	.globl	ooz
	.align 4
ooz:
	.space 4
	.globl	xp
	.align 4
xp:
	.space 4
	.globl	yp
	.align 4
yp:
	.space 4
	.globl	idx
	.align 4
idx:
	.space 4
	.text
	.globl	calculateX
	.def	calculateX;	.scl	2;	.type	32;	.endef
	.seh_proc	calculateX
calculateX:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	movaps	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 16(%rbp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	movl	%ecx, 48(%rbp)
	movl	%edx, 56(%rbp)
	movl	%r8d, 64(%rbp)
	pxor	%xmm6, %xmm6
	cvtsi2sdl	56(%rbp), %xmm6
	movss	A(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm6
	movss	B(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm6
	movss	C(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	64(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm7, %xmm0
	subsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	56(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	64(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm6
	movss	C(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	sin
	addsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	48(%rbp), %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movaps	0(%rbp), %xmm6
	movaps	16(%rbp), %xmm7
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calculateY
	.def	calculateY;	.scl	2;	.type	32;	.endef
	.seh_proc	calculateY
calculateY:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	movaps	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 16(%rbp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	movl	%ecx, 48(%rbp)
	movl	%edx, 56(%rbp)
	movl	%r8d, 64(%rbp)
	pxor	%xmm6, %xmm6
	cvtsi2sdl	56(%rbp), %xmm6
	movss	A(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm6
	movss	C(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	64(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	56(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	subsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	64(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	addsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	48(%rbp), %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm7
	movss	C(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	movapd	%xmm6, %xmm1
	subsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsd2ss	%xmm1, %xmm0
	movaps	0(%rbp), %xmm6
	movaps	16(%rbp), %xmm7
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calculateZ
	.def	calculateZ;	.scl	2;	.type	32;	.endef
	.seh_proc	calculateZ
calculateZ:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	movaps	%xmm6, 0(%rbp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 16(%rbp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	movl	%ecx, 48(%rbp)
	movl	%edx, 56(%rbp)
	movl	%r8d, 64(%rbp)
	pxor	%xmm6, %xmm6
	cvtsi2sdl	64(%rbp), %xmm6
	movss	A(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm6
	movss	B(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	56(%rbp), %xmm7
	movss	A(%rip), %xmm0
	pxor	%xmm3, %xmm3
	cvtss2sd	%xmm0, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm0, %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm4, %xmm4
	cvtss2sd	%xmm0, %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	call	cos
	mulsd	%xmm7, %xmm0
	subsd	%xmm0, %xmm6
	pxor	%xmm7, %xmm7
	cvtsi2sdl	48(%rbp), %xmm7
	movss	B(%rip), %xmm0
	pxor	%xmm5, %xmm5
	cvtss2sd	%xmm0, %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	call	sin
	mulsd	%xmm7, %xmm0
	addsd	%xmm6, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movaps	0(%rbp), %xmm6
	movaps	16(%rbp), %xmm7
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	calculateForSurface
	.def	calculateForSurface;	.scl	2;	.type	32;	.endef
	.seh_proc	calculateForSurface
calculateForSurface:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movss	%xmm0, 16(%rbp)
	movss	%xmm1, 24(%rbp)
	movss	%xmm2, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movss	32(%rbp), %xmm0
	cvttss2sil	%xmm0, %ecx
	movss	24(%rbp), %xmm0
	cvttss2sil	%xmm0, %edx
	movss	16(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	calculateX
	movd	%xmm0, %eax
	movl	%eax, x(%rip)
	movss	32(%rbp), %xmm0
	cvttss2sil	%xmm0, %ecx
	movss	24(%rbp), %xmm0
	cvttss2sil	%xmm0, %edx
	movss	16(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	calculateY
	movd	%xmm0, %eax
	movl	%eax, y(%rip)
	movss	32(%rbp), %xmm0
	cvttss2sil	%xmm0, %ecx
	movss	24(%rbp), %xmm0
	cvttss2sil	%xmm0, %edx
	movss	16(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	calculateZ
	movd	%xmm0, %eax
	movl	%eax, z(%rip)
	movss	z(%rip), %xmm1
	movss	.LC0(%rip), %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, ooz(%rip)
	movl	width(%rip), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movss	cubeWidth(%rip), %xmm0
	addss	%xmm0, %xmm0
	subss	%xmm0, %xmm1
	movss	K1(%rip), %xmm2
	movss	ooz(%rip), %xmm0
	mulss	%xmm0, %xmm2
	movss	x(%rip), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, xp(%rip)
	movl	height(%rip), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	pxor	%xmm1, %xmm1
	cvtsi2ssl	%eax, %xmm1
	movss	K1(%rip), %xmm2
	movss	ooz(%rip), %xmm0
	mulss	%xmm0, %xmm2
	movss	y(%rip), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, yp(%rip)
	movl	yp(%rip), %edx
	movl	width(%rip), %eax
	imull	%eax, %edx
	movl	xp(%rip), %eax
	addl	%edx, %eax
	movl	%eax, idx(%rip)
	movl	idx(%rip), %eax
	testl	%eax, %eax
	js	.L13
	movl	width(%rip), %edx
	movl	height(%rip), %eax
	imull	%eax, %edx
	movl	idx(%rip), %eax
	cmpl	%eax, %edx
	jle	.L13
	movl	idx(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	zBuffer(%rip), %rax
	movss	(%rdx,%rax), %xmm1
	movss	ooz(%rip), %xmm0
	comiss	%xmm1, %xmm0
	ja	.L12
	jmp	.L13
.L12:
	movl	idx(%rip), %eax
	movss	ooz(%rip), %xmm0
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	zBuffer(%rip), %rax
	movss	%xmm0, (%rdx,%rax)
	movl	idx(%rip), %eax
	movl	40(%rbp), %edx
	movl	%edx, %ecx
	cltq
	leaq	buffer(%rip), %rdx
	movb	%cl, (%rax,%rdx)
.L13:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "\33[2J\0"
.LC3:
	.ascii "A: %f, B: %f, C: %f\12\0"
.LC4:
	.ascii "\33[H\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	call	__main
	leaq	.LC1(%rip), %rcx
	call	printf
.L23:
	movl	width(%rip), %edx
	movl	height(%rip), %eax
	imull	%edx, %eax
	movslq	%eax, %rdx
	movl	backgroundASCIICode(%rip), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	buffer(%rip), %rcx
	call	memset
	movl	width(%rip), %edx
	movl	height(%rip), %eax
	imull	%edx, %eax
	sall	$2, %eax
	cltq
	movq	%rax, %r8
	movl	$0, %edx
	leaq	buffer(%rip), %rcx
	call	memset
	movss	cubeWidth(%rip), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	jmp	.L15
.L18:
	movss	cubeWidth(%rip), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	jmp	.L16
.L17:
	movss	cubeWidth(%rip), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm0, %xmm1
	movss	-8(%rbp), %xmm0
	movl	-4(%rbp), %eax
	movl	$46, %r9d
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movl	cubeWidth(%rip), %eax
	movss	-4(%rbp), %xmm1
	movss	-8(%rbp), %xmm0
	movl	$36, %r9d
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movss	-4(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	movaps	%xmm0, %xmm2
	xorps	%xmm1, %xmm2
	movss	cubeWidth(%rip), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movd	%xmm0, %eax
	movss	-8(%rbp), %xmm0
	movl	$126, %r9d
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movss	cubeWidth(%rip), %xmm2
	movss	-4(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movd	%xmm0, %eax
	movss	-8(%rbp), %xmm0
	movl	$35, %r9d
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movss	-8(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	movaps	%xmm0, %xmm2
	xorps	%xmm1, %xmm2
	movss	cubeWidth(%rip), %xmm0
	movss	.LC2(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	movl	$58, %r9d
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movss	cubeWidth(%rip), %xmm0
	movss	-8(%rbp), %xmm1
	movl	-4(%rbp), %eax
	movl	$43, %r9d
	movaps	%xmm1, %xmm2
	movaps	%xmm0, %xmm1
	movd	%eax, %xmm0
	call	calculateForSurface
	movss	incrementSpeed(%rip), %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
.L16:
	movss	cubeWidth(%rip), %xmm0
	comiss	-8(%rbp), %xmm0
	ja	.L17
	movss	incrementSpeed(%rip), %xmm0
	movss	-4(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
.L15:
	movss	cubeWidth(%rip), %xmm0
	comiss	-4(%rbp), %xmm0
	ja	.L18
	movss	C(%rip), %xmm0
	pxor	%xmm2, %xmm2
	cvtss2sd	%xmm0, %xmm2
	movss	B(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movss	A(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movq	%xmm2, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm2
	movq	%rax, %rcx
	movq	%xmm1, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	movq	%xmm0, %rax
	movq	%rax, %r8
	movq	%r8, %xmm0
	movapd	%xmm2, %xmm3
	movq	%rcx, %r9
	movapd	%xmm1, %xmm2
	movq	%rdx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	printf
	leaq	.LC4(%rip), %rcx
	call	printf
	movl	$0, -12(%rbp)
	jmp	.L19
.L22:
	movl	width(%rip), %ecx
	movl	-12(%rbp), %eax
	cltd
	idivl	%ecx
	movl	%edx, %eax
	testl	%eax, %eax
	je	.L20
	movl	-12(%rbp), %eax
	cltq
	leaq	buffer(%rip), %rdx
	movzbl	(%rax,%rdx), %eax
	movsbl	%al, %eax
	jmp	.L21
.L20:
	movl	$10, %eax
.L21:
	movl	%eax, %ecx
	call	putchar
	addl	$1, -12(%rbp)
.L19:
	movl	width(%rip), %edx
	movl	height(%rip), %eax
	imull	%edx, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L22
	movss	A(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, A(%rip)
	movss	B(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, B(%rip)
	movl	$1000, %ecx
	call	usleep
	movss	A(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, A(%rip)
	movss	B(%rip), %xmm0
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm1
	movsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, B(%rip)
	movl	$1000, %ecx
	call	usleep
	jmp	.L23
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1065353216
	.align 16
.LC2:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.align 8
.LC5:
	.long	1202590843
	.long	1064598241
	.ident	"GCC: (tdm64-1) 10.3.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	sin;	.scl	2;	.type	32;	.endef
	.def	cos;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	usleep;	.scl	2;	.type	32;	.endef
