; Calculating a Factorial                   (Fact.asm)

; This program uses recursion to calculate the
; factorial of an integer.

.386
.MODEL FLAT

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

INCLUDE io.h            ; header file for input/output
INCLUDE debug.h  

cr      EQU     0dh     ; carriage return character
Lf      EQU     0ah     ; line feed

.STACK  4096            ; reserve 4096-byte stack

.DATA

.code
_main PROC
	push 5			; calculate 5 factorial
	call Factorial		; calculate factorial (eax)
	outputD eax 
	
	INVOKE  ExitProcess, 0  ; exit with return code 0


	
_main ENDP

Factorial PROC
	push ebp
	mov  ebp,esp
	
	mov  eax,[ebp+8]	; get n
	cmp  eax,0		; n < 0?
	ja   L1			; yes: continue
	mov  eax,1		; no: return 1
	jmp  L2

L1:	dec  eax
	push eax			; Factorial(n-1)
	call Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx,[ebp+8]   	; get n
	mul  ebx          	; ax = ax * bx

L2:	pop  ebp			; return EAX
	ret  4			; clean up stack
Factorial ENDP

END