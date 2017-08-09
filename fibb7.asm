;------------------------------------------------------
; First 7 Fibonacci
; Author: Saurabh Tomar
; Written for CPSC355
; Description: This program loops to calculate the first
;				seven values of the Fibonacci number sequence
;------------------------------------------------------

INCLUDE Irvine32.inc

; Initialize the data
.DATA
fibArray DWORD 7 DUP(0)

.CODE
;------------------------------------------------------
; fibo
; Takes an empty array of 2 or more elements and fills it with
; the Fibonacci sequence numbers. The default is 7 but it can be
; of any length greater than 2. Stores and adds them in EAX register 
; and uses ESI to point to the elements in the array.
; Recieves: 1 empty array
; Returns: 1 filled array 
;------------------------------------------------------
fibo PROC
	
	; Set the position to the begining of the array
	mov ECX, LENGTHOF fibArray
	mov ESI, OFFSET fibArray

	; Setup the two initial values of the array Fib(1) and Fib(2)
	mov EAX, 1

	; Set Fib(1)	
	mov [ESI], EAX
	add ESI, TYPE fibArray
	dec ECX

	; Set Fib(2)
	mov [ESI], EAX
	dec ECX

	; Loop through the rest of the sequence. Store the current element
	; in the EAX register and then move back one element and add that
	; element to the EAX register. Then move forward two elements and store
	; the sum in there. Rinse and repeat.
	L1:
		mov EAX, [ESI]
		sub ESI, TYPE fibArray
		add EAX, [ESI]
		add ESI, (TYPE fibArray * 2)
		mov [ESI], EAX
	loop L1

	; Prep to display the results on the screen
	mov ECX, LENGTHOF fibArray
	mov EDI, OFFSET fibArray

	; Loop through and display
	L2:
		mov EAX, [EDI]
		add EDI, TYPE fibArray
		call WriteInt
		call Crlf
	loop L2

	call WaitMsg

	exit

fibo ENDP
END fibo
