# CS 2640
# Group - 2. Project Check-In Progress 


.data
	wordleDescription:	.asciiz "Wordle: Guess the 5 letter word in 5 tries!\n\n"
	cat: 		.asciiz " /\\,,,/\\ \n=(O w O)=\n|--U U-----------------|\n|       (WORDLE)       |   \n|----------------------|\n\n"
	firstGuess: 	.asciiz "First Guess: "
	secondGuess: 	.asciiz "First Guess: "
	thirdGuess: 	.asciiz "First Guess: "
	fourthGuess	.asciiz "First Guess: "
	fifthGuess: 	.asciiz "First Guess: "
	nameBuffer: 	.space 6

#multiple five letter words
	wordBank:	.asciiz "abyss"
				.asciiz "acing" 
				.asciiz "acids" 
				.asciiz "acher"
				.asciiz "acorn" 
				.asciiz "acute"
				.asciiz "adapt"
				.asciiz "added" 
				.asciiz "adlib" 
				.asciiz "admin" 
				.asciiz "adult" 
				.asciiz "agent"
				.asciiz "agile"
				.asciiz "agony"
				.asciiz "agree"
				.asciiz "ahead"
				.asciiz "alamo"
				.asciiz "alarm"
				.asciiz "alike"
				.asciiz "alley"
				.asciiz "aloof"
				.asciiz "alone"
				.asciiz "alpha"
				.asciiz "aloud"
				.asciiz "badly"
				.asciiz "baggy"
				.asciiz "baked"
				.asciiz "basil"
				.asciiz "bazar"
				.asciiz "beany"
				.asciiz "beans"
				.asciiz "beads"
				.asciiz "break"
				.asciiz "beach"
				.asciiz "beets"
				.asciiz "beige"
				.asciiz "berry"
				.asciiz "birds"
				.asciiz "black"
				.asciiz "blank"
				.asciiz "blaze"
				.asciiz "blend"
				.asciiz "bread"
				.asciiz "block"
				.asciiz "bloom"
				.asciiz "blown"
				.asciiz "caged"
				.asciiz "caked"
				.asciiz "calve"
				.asciiz "camal"
				.asciiz "canal"
				.asciiz "candy"
				.asciiz "canon"
				.asciiz "canoe"
				.asciiz "carve"
				.asciiz "carts" 
				.asciiz "cents"
				.asciiz "chart"
				.asciiz "charm"
				.asciiz "chats"
				.asciiz "chalk"
				.asciiz "crawl"
				.asciiz "cheap"
				.asciiz "chili"
				.asciiz "chimp"
				.asciiz "child"
				.asciiz "chirp"
				.asciiz "chips" 
				.asciiz "daisy"
				.asciiz "dance"
				.asciiz "dated"
				.asciiz "darts" 
				.asciiz "dandy"
				.asciiz "delta"
				.asciiz "decaf"
				.asciiz "defog"
				.asciiz "debug"
				.asciiz "earns"
				.asciiz "edges"
				.asciiz "edits"
				.asciiz "easel"
				.asciiz "elbow"
				.asciiz "essay"
				.asciiz "error"
				.asciiz "erupt"
				.asciiz "exist"
				.asciiz "ethos"
				.asciiz "ethics"
				.asciiz "fable"
				.asciiz "faces"
				.asciiz "fails"
				.asciiz "faint"
				.asciiz "fairy"
				.asciiz "faith"
				.asciiz "faked" 
				.asciiz "fairs"
				.asciiz "faint"
				.asciiz "fades"
				.asciiz "faded"
				.asciiz "facts"
				.asciiz "favor"
				.asciiz "feast"
				.asciiz "fears"
				.asciiz "feels"
				.asciiz "fatal"
				.asciiz "feign"
				.asciiz "fetch"
				.asciiz "fazed"
				.asciiz "fancy"
				.asciiz "fangs"
				.asciiz "gummy"
				.asciiz "grump"
				.asciiz "grout"
				.asciiz "guest"
				.asciiz "guide"
				.asciiz "guilt"	
				.asciiz "habit"
				.asciiz "hacks"
				.asciiz "haiku"
				.asciiz "hails"
				.asciiz "hasty" 
				.asciiz "hippo"
				.asciiz "husky"
				.asciiz "hyper"
				.asciiz "hypes"
				.asciiz "icing"
				.asciiz "icons"
				.asciiz "ideal"
				.asciiz "idols"
				.asciiz "igloo"
				.asciiz "idiom"
				.asciiz "ivory"
				.asciiz "itchy"
				.asciiz "jails"
				.asciiz "juicy"
				.asciiz "junky" 
				.asciiz "laces"
				.asciiz "lader"
				.asciiz "macaw"
				.asciiz "macro"
				.asciiz "maids"
				.asciiz "madly"
				.asciiz "madam"
				.asciiz "nails"
				.asciiz "names"
				.asciiz "naive"
				.asciiz "ocean"
				.asciiz "octal"
				.asciiz "occur"
				.asciiz "oaths"
				.asciiz "paced"
				.asciiz "pairs"
				.asciiz "petal"
				.asciiz "quart"
				.asciiz "quail"
				.asciiz "quads"
				.asciiz "queen"
				.asciiz "rabid"
				.asciiz "racer"
				.asciiz "raced"
				.asciiz "radar"
				.asciiz "radio"
				.asciiz "raggy"
				.asciiz "rails"
				.asciiz "rainy"
				.asciiz "raise"
				.asciiz "saber"
				.asciiz "sacks"
				.asciiz "sails"
				.asciiz "saint"
				.asciiz "snake"
				.asciiz "saggy"
				.asciiz "taboo"
				.asciiz "tacky"
				.asciiz "tails"
				.asciiz "taint"
				.asciiz "taken"
				.asciiz "train"
				.asciiz "ultra"
				.asciiz "unbid"
				.asciiz "unbox"
				.asciiz "uncap"
				.asciiz "vacay"
				.asciiz "vapor"
				.asciiz "valid"
				.asciiz "wacky"
				.asciiz "waist" 
				.asciiz "wages"
				.asciiz "yacht"
				.asciiz "yacks"
				.asciiz "yawns"
				.asciiz "yearn"
				.asciiz "yards"
				.asciiz "zebra"
				.asciiz "zesty"
				.asciiz "zeros" 	  	
				  	

	winMessage:	.asciiz "YAY YOU WON!"
	playAgainMessage: .asciiz "Would you like to play again? \n Yes(y) or No(n)"
	noOpt: 		.asciiz "Okay, see you next time <3"

.text

main:
	li $v0, 4
	la $a0, cat
	syscall
	
	li $v0, 4
	la $a0, wordleDescription
	syscall
	
	li $v0, 4
	la $a0, firstGuess
	syscall

#prints win message 
win: 
	li $v0, 4 
	la $a0, winMessage 
	syscall
	
	jr $ra #return to call
	
	
replay: 

#print play again prompt
	li $v0, 4
	la $a0 playAgainMessage  
	syscall

#reads player response 
	li $v0, 5 
	syscall 
	move $t0, $v0 
#if yes play again going back to main 	
	li $t1, 'y'
	beq $t0, $t1, main
# else jumps to exit message and exits program 
	 j exit 
#exits program 	and disaplays noOPt 
exit:
	#prints out noOpt message 
	li $v0, 4 
	la $a0, noOpt
	syscall
	
	#exits program
	li $v0, 10
	syscall 

# CS 2640 - Wordle input validation

validateGuess:
	
    	move $t0, $a0
	li $t1, 5

validateLetter:
	lbu $t2, 0($t0)

	# Reject bytes below 'A', including digits, spaces, and early Enter.
    	blt $t2, 'A', invalidGuessFormat
    	nop
    	bgt $t2, 'Z', checkLowercase # Bytes above 'Z' might be lowercase.
    	nop

    	# Uppercase ASCII letters are 32 below their lowercase equivalents. Convert uppercase ASCII to lowercase.
    	addiu $t2, $t2, 32
    	sb $t2, 0($t0)

checkLowercase:
	# Reject anything outside 'a' through 'z', including symbols.
    	blt $t2, 'a', invalidGuessFormat
    	nop
    	bgt $t2, 'z', invalidGuessFormat
   		nop

    	addiu $t0, $t0, 1
    	addiu $t1, $t1, -1
    	bnez $t1, validateLetter
    	nop

    	# After exactly five letters, the next byte should be Enter. A sixth letter, space, or symbol makes the guess invalid.
    	lbu $t2, 0($t0)
    	li $t3, 10
    	bne $t2, $t3, invalidGuessFormat
    	nop
	
	# Replace the newline with '\0' so the word-bank lookup gets five letters.
    	sb $zero, 0($t0)
    	li $v0, 1
    	jr $ra
    	nop

invalidGuessFormat:
    	move $v0, $zero		# Tell the caller to reject the guess.
    	jr $ra
    	nop
