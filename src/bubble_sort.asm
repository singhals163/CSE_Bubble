.data
array: .word 5, 2, 8, 1, 3    # Array to be sorted
n: .word 5                    # Size of the array
temp: .word 0                 # Temporary variable for swapping

.text
.globl main

main:
    # Load size of array into $t0
    lw $t0, n

    # Outer loop for bubble sort
    outer:
    # branch condition
        addi $t1, $zero, 1          # Set flag to 1
        addi $t2, $zero, 0          # Set index i to 0

        # Inner loop for bubble sort
        inner:
            # Check if i < n-1
            slt $t3, $t2, $t0
            beq $t3, $zero, exit_inner

            # Load array[i] and array[i+1] into $t4 and $t5
            sll $t6, $t2, 2
            add $t4, $zero, $t6
            # add $t5, $zero, $t6
            addi $t5, $t6, 4
            lw $t3, array($t4)
            lw $t6, array($t5)

            # Compare array[i] and array[i+1]
            slt $t7, $t6, $t3
            beq $t7, $zero, skip_swap

            # Swap array[i] and array[i+1]
            sw $t4, temp
            sw $t5, array($t4)
            lw $t4, temp
            sw $t4, array($t5)

            # Set flag to 0
            addi $t1, $zero, 0

            skip_swap:
            addi $t2, $t2, 1          # Increment index i
            j inner

        exit_inner:
        # Check if flag is still 1, if not then array is sorted
        beq $t1, $zero, outer_exit

        # Decrement size of array
        addi $t0, $t0, -1
        j outer

    outer_exit:
    # Exit program
    li $v0, 10
    syscall
