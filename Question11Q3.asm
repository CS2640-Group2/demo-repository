
# Name: Thar Linn Htet
# Date: October 30, 2026
# Question 11

.data
    months: .asciiz "30 days has September, April, June, and November"

.text

main:
    # Print the integer stored in $t4.
    li $v0, 1
    move $a0, $t4
    syscall

    # Load the address of months into $s1.
    la $s1, months

    # Exit the program.
    li $v0, 10
    syscall
