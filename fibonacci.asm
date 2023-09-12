.data
prompt: .asciiz "Ingrese la cantidad de términos de la serie Fibonacci: "
result: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Pide al usuario la cantidad de términos
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  # Guarda la cantidad de términos en $s0

    # Inicializa los primeros dos términos
    li $s1, 0  # Primer término (anterior)
    li $s2, 1  # Segundo término (actual)

    # Imprime el primer término
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $s1
    li $v0, 1
    syscall

    # Genera la serie Fibonacci
    move $t0, $s0  # Copia la cantidad de términos a $t0
    beqz $t0, exit  # Si la cantidad de términos es 0, termina el programa
    subi $t0, $t0, 2  # Decrementa la cantidad de términos para tener en cuenta los dos primeros

fib_loop:
    # Calcula el siguiente término
    add $s3, $s1, $s2  # $s3 = $s1 + $s2
    move $s1, $s2     # Actualiza el término anterior con el actual
    move $s2, $s3     # Actualiza el término actual con el siguiente

    # Imprime el siguiente término
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $s3
    li $v0, 1
    syscall

    subi $t0, $t0, 1  # Decrementa el contador de términos
    bnez $t0, fib_loop  # Salta de nuevo al bucle si quedan términos

exit:
    # Termina el programa
    li $v0, 10
    syscall
