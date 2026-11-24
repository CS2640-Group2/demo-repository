.data 


#multiple five letter words

word1: .asciiz "abyss"
word2: .asciiz "acing"
wordBank: .word word1, word2...

wordBank: 
	.asciiz "abyss acing acids acher acorn acute adapt added adlib admin adult agent agile agony agree ahead alamo alarm alike alley aloof alone alpha aloud badly baggy baked basil bazar beany beans beads breaks beach beets beige berry birds black blank blaze blend bread block bloom blown caged caked calve camal canal candy canon canoe carve carts cents chart charm chats chalk crawl cheap chili chimp child chirp chips daisy dance dated darts dandy dairy daily dames damps dally dales ducks decoy delta decaf defog debug debit dirty disco ditch eager eagle eater earth earns edges edits easel elbow essay error erupt exist ethos ethics fable faces fails faint fairy faith faked fairs faint fades faded facts favor feast fears feels fatal feign fetch fazed fancy fangs falls feral flats fifth filed galop grape ghoul gifts ghost glace glass gloom growl gummy grump grout guest guide guilt habit hacks haiku hails hairs hairy hasty haunt hazel hawks heart hired hobby hives hired hippo husky hyper hypes icing icons ideal idols igloo idiom ivory itchy jails juicy junky laces lader macaw macro maids madly madam nails names naive ocean octal occur oaths paced pairs petal quart quail quads queen rabid racer raced radar radio raggy rails rainy raise saber sacks sails saint snake saggy taboo tacky tails taint taken train ultra unbid unbox uncap vacay vapor valid wacky waist wages yacht yacks yawns yearn yards zebra zesty zeros " 
	
winMessage: .asciiz "YAY YOU WON!"

playAgainMessage: .asciiz "Would you like to play again? \n Yes(y) or No(n)"

noOpt: .asciiz "Okay, see you next time <3"


welcomeMsg: .asciiz "\n~~~~~~ WORDLE ~~~~~~\nGuess the 5 letter word in 6 attempts!!"
rulesMsg: .asciiz "\nX = not in the word\nY (Yellow) = In the word but wrong place\nG (Green) = In the word and right place"
guessMsg: .asciiz "Enter 5 letter word\n"
incorrect: .asciiz "X"
correct: .asciiz "G"
wrongPosition: .asciiz "Y"

answer: .space 6
guess: .space 30


.text
# welcome message
	li $v0, 4
	la $a0, welcomeMsg
	syscall

# Getting random word for user to guess

# each word associate to a number/ randomly choose number
	li $v0, 42
	li $a0, 0
	li $a1, # number of words
	syscall
	
#get address from the word bank
	sll $t0, $a0, 2
	la $t1, wordBank
	add $t1, $t1, $t0
	lw $t2, 0($t1)
	
# copy random word into the answer
	la $t3, answer

copyWord:
	lb $t5, 0($t2)
	sb $t5, 0($t3)
	
	beq $t5, $zero, attempts
	
	addi $t2, $t2, 1
	addi $t3, $t3, 1
	j copyWord
	
attempts:

	li $s0, 0
	li $s1, 6 #maximum of 6 or 5 (I say 6)
	
wordleLoop:

	beq $s0, $s1, lose
	
# guess prompt
	li $v0, 4
	la $a0, guessMsg
	syscall
	
#read teh guess
	li $v0, 8
	la $a0, guess
	li $a1, 20
	syscall
	
	la $t0, guess
	li $t1, 0

guessCheck:

	la $t0, guess
	la $t1, answer
	
	li $t2, 0
	li $s2, 0  #right position
	
letterCheck:
	beq $t2, 5, checkWin
	
	lb $t3, 0($t0)
	lb $t4, 0($t1)
	
	#correct position
	beq $t3, $t4, correct
	
	# look for letter in answer
	la $t5, answer
	li $t6, 0
	
searchLoop:
	beq $t6, 5, notFound
	
	lb $t7, 0($t5)
	beq $t3, $t7, found
	
	addi $t5, $t5, 1
	addi $t6, $t6, 1
	j searchLoop
	
correctLetter:
	li $v0, 11
	li $a0, 71
	syscall
	
	addi $s2, $s2, 1
	j nextLetter

found:
	li $v0, 11
	li $a0, 89
	syscall
	j nextLetter
	
notFound:
	li $v0, 11
	li $a0, 88
	syscall
	
nextLetter:
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j searchLoop
	
checkWin:
	li $t0, 5
	beq $s2, $t0, win
	
	addi $s0, $s0, 1
	j wordleLoop
	



#validate that its 5 characters- create a validate directive 

validate:

validWordLength:

invalidGuess:







#prints win message 
win: 
	li $v0, 4 
	la $a0, winMessage 
	syscall
	
	jr $ra #return to call

lose:
	li $v0, 4
	la $s0, loseMsg
	syscall
	
	li $v0, 4
	la $a0, answer
	syscall
	
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
