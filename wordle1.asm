.data 


#multiple five letter words
wordBank: 
	.asciiz "abyss acing acids acher acorn acute adapt added adlib admin adult agent agile agony agree ahead alamo alarm alike alley aloof alone alpha aloud badly baggy baked basil bazar beany beans beads breaks beach beets beige berry birds black blank blaze blend bread block bloom blown caged caked calve camal canal candy canon canoe carve carts cents chart charm chats chalk crawl cheap chili chimp child chirp chips daisy dance dated darts dandy dairy daily dames damps dally dales ducks decoy delta decaf defog debug debit dirty disco ditch eager eagle eater earth earns edges edits easel elbow essay error erupt exist ethos ethics fable faces fails faint fairy faith faked fairs faint fades faded facts favor feast fears feels fatal feign fetch fazed fancy fangs falls feral flats fifth filed galop grape ghoul gifts ghost glace glass gloom growl gummy grump grout guest guide guilt habit hacks haiku hails hairs hairy hasty haunt hazel hawks heart hired hobby hives hired hippo husky hyper hypes icing icons ideal idols igloo idiom ivory itchy jails juicy junky laces lader macaw macro maids madly madam nails names naive ocean octal occur oaths paced pairs petal quart quail quads queen rabid racer raced radar radio raggy rails rainy raise saber sacks sails saint snake saggy taboo tacky tails taint taken train ultra unbid unbox uncap vacay vapor valid wacky waist wages yacht yacks yawns yearn yards zebra zesty zeros " 
	
winMessage: .asciiz "YAY YOU WON!"

playAgainMessage: .asciiz "Would you like to play again? \n Yes(y) or No(n)"

noOpt: .asciiz "Okay, see you next time <3"

.text


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
