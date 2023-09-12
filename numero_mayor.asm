.data
prompt: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el siguiente número: "
result: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Pide el primer número
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  # Guarda el primer número en $s0

    # Inicializa el número máximo con el primer número ingresado
    move $s1, $s0  # $s1 = $s0

    # Pide los siguientes números y compara
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $s2, $v0  # Guarda el segundo número en $s2
    bgt $s2, $s1, update_max  # Salta a update_max si $s2 > $s1

    # Pide otro número y compara
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $s3, $v0  # Guarda el tercer número en $s3
    bgt $s3, $s1, update_max  # Salta a update_max si $s3 > $s1

    # Imprime el número mayor
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $s1
    li $v0, 1
    syscall

    # Termina el programa
    li $v0, 10
    syscall

update_max:
    move $s1, $s2
    j main

