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
	wordBank:	.asciiz "abyss acing acids acher acorn acute adapt added adlib admin adult agent agile agony agree ahead alamo alarm alike alley aloof alone alpha aloud badly baggy baked basil bazar beany beans beads breaks beach beets beige berry birds black blank blaze blend bread block bloom blown caged caked calve camal canal candy canon canoe carve carts cents chart charm chats chalk crawl cheap chili chimp child chirp chips daisy dance dated darts dandy dairy daily dames damps dally dales ducks decoy delta decaf defog debug debit dirty disco ditch eager eagle eater earth earns edges edits easel elbow essay error erupt exist ethos ethics fable faces fails faint fairy faith faked fairs faint fades faded facts favor feast fears feels fatal feign fetch fazed fancy fangs falls feral flats fifth filed galop grape ghoul gifts ghost glace glass gloom growl gummy grump grout guest guide guilt habit hacks haiku hails hairs hairy hasty haunt hazel hawks heart hired hobby hives hired hippo husky hyper hypes icing icons ideal idols igloo idiom ivory itchy jails juicy junky laces lader macaw macro maids madly madam nails names naive ocean octal occur oaths paced pairs petal quart quail quads queen rabid racer raced radar radio raggy rails rainy raise saber sacks sails saint snake saggy taboo tacky tails taint taken train ultra unbid unbox uncap vacay vapor valid wacky waist wages yacht yacks yawns yearn yards zebra zesty zeros " 	
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
