.macro getString(%bufferName, %bufferLength, %reg)
	li $v0, 8
	la $a0, %bufferName
	li $a1, %bufferLength
	syscall
	#move %reg, $a0
.end_macro


.macro getInt
	li $v0, 5
	syscall
.end_macro

.macro printString(%string)
	li $v0, 4
	la $a0, %string
	syscall
.end_macro
