; reverse gcd .asm

; Jordan Seth Myers
; 11/30/20
;Program 2


.386
.MODEL FLAT

INCLUDE debug.h

ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD


.STACK 4056    ; 4096 byte stack 

.DATA          ; reserve storage for data 

prompt1 BYTE "Enter the first number:  ", 0
prompt2 BYTE "Enter the second number:  ", 0
;; prompt3 BYTE "The input you entered was not valid... retry", 0     ; if the user were to input invalid characters 

divide  WORD  ?   ; testing
remain  WORD  ?

a 		WORD  ?  ; testing purposes 
b       WORD  ?  ; testing purposes 

result BYTE "The greatest common divisor is:   ", 0


.CODE 

_main  PROC 

ifBadInput:

			inputw prompt1, gcd  ; input to call from gcd 
			cmp gcd, 0
			jle ifBadInput     ; jump to ifBadInput2
		

ifBadInput2:
			inputw prompt2, remain
			cmp remain,0
			jle ifBadInput2     ; jump to ifBadInput
	
	
	push remain       ; pushonto the stack 
	push gcd   ; push onto off remain 
	
	call recurse  ; call the recurse procedure
	
	
	output result
	output gcd						; output everthing 

	output result 
	outputD eax						; output the register 
	
  
_main  ENDP
  
  	
recurse PROC 

	push ebp 
	mov ebp,esp
	mov eax, [esp+8]
	mov ebx, [ebp+12] 
	cmp ebx,0
	je  check                     ; jump to if equal check if the number works
	
	mov edx,0 
	div ebx
	mov eax,edx 
	
	push eax
	push ebx 
	
	call recurse 
	
	check:
		 pop ebp
		 ret 8 
		 
		 recurse ENDP


END 