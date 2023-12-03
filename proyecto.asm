#          Proyecto Laberinto-Organizacion del Computador	
#	   Universidad Metropolitana.  Caracas - Venezuela
# 	   Elaborado por:
#			  - Karelin Guzman 
#			  - Luis Arismendi
#                         - Miguel Jimenez 


.data
	
	display: .space 1024
	cadena: .space 33
	perdiste: .asciiz "\nï¿½GAME OVER! D:"
	ganaste: .asciiz "\nï¿½YOU WIN! :D Tu puntuacion final es:"
	puntaje_decimal: .asciiz "\n     Decimal: "
	puntaje_binario: .asciiz "\n     Binario: "
	puntaje_octal: .asciiz "\n     Octal: "
	puntaje_hexadecimal: .asciiz "\n     Hexadecimal: "
	#hex
	resultado1: .space 21
	#octal
	result: .space 33
	#binario 
	result2: .space 33
	
.text

#############################    COLORES    #############################    
#MAPA
li $t0 0x5F6F52 # Verde Oscuro para las Paredes
li $t8 0xB0A695 # Marrï¿½n para el color de los Caminos y el Fondo
li $t7 0xF9B572 # Naranja para la Meta
#JUDGADOR Y ENEMIGOS
li $t4 0xFEFAE0 # Crema para el Personaje
li $t5 0x872341# Vinotinto para los Enemigos
#PUNTAJES
li $t6 0xFFE17B # Amarillo para las Monedas

li $t1 0 
li $t2 0
li $t3 4

#############################    BORDES DEL MAPA    #############################    
mapa:	
	#Pinta Fondo
 	li $t1, 0
 	fondo:
	sw $t8 display($t1)
	addi $t1 $t1 4
	beq $t1 1024 cambio_pared_superior #Cambia de llenar el fondo a llenar la pared superior
	j fondo
	
	#Pinta Pared Superior
 	cambio_pared_superior:
 	li $t1, 0
 	pared_superior: 
 	sw $t0 display($t1)
 	addi $t1,$t1, 4 	 
 	beq $t1, 64, cambio_pared_inferior
 	j pared_superior	 
 	 
 	#Pinta Pared Inferior
 	cambio_pared_inferior :
 	li $t1 960
 	pared_inferior:
	sw $t0 display($t1)
 	addi $t1,$t1, 4
 	beq $t1, 1020, cambio_pared_izquierda	
 	j pared_inferior
 		
 	#Pinta Pared Izquierda
 	cambio_pared_izquierda:
 	li $t1 0
 	pared_izquierda:
 	sw $t0 display($t1)
 	addi $t1,$t1, 64
 	beq $t1, 960, cambio_pared_derecha		
 	j pared_izquierda
 	
	#Pinta Pared Derecha
 	cambio_pared_derecha:
 	li $t1 60
 	pared_derecha:
 	sw $t0 display($t1)
 	addi $t1,$t1, 64 	 
 	bne $t1, 1020, pared_derecha
 	li $t1 1020
 	sw $t0 display($t1)
 	
 	
#############################    LIMITES INTERNOS DEL MAPA    #############################    
 	li $t1 132
 	sw $t0 display($t1)
 	li $t1 140
 	sw $t0 display($t1)
 	li $t1 148
 	sw $t0 display($t1)
 	li $t1 152
 	sw $t0 display($t1)
 	li $t1 156
 	sw $t0 display($t1)
 	li $t1 160
 	sw $t0 display($t1)
 	li $t1 172
 	sw $t0 display($t1)
 	li $t1 176
 	sw $t0 display($t1)
 	
 	li $t1 196
 	sw $t0 display($t1) 
 	li $t1 204
 	sw $t0 display($t1)
 	li $t1 212
 	sw $t0 display($t1)
 	li $t1 224 	
 	sw $t0 display($t1)
 	li $t1 228
 	sw $t0 display($t1)
 	li $t1 236
 	sw $t0 display($t1)
 	li $t1 240
 	sw $t0 display($t1)
 	
 	li $t1 268
 	sw $t0 display($t1)
 	li $t1 292
 	sw $t0 display($t1)
 	li $t1 300
 	sw $t0 display($t1)
 	li $t1 304
 	sw $t0 display($t1)
 	
 	li $t1 328
 	sw $t0 display($t1)
 	li $t1 332
 	sw $t0 display($t1)
 	li $t1 336
 	sw $t0 display($t1)
 	li $t1 340
 	sw $t0 display($t1)
 	li $t1 348
 	sw $t0 display($t1)
 	li $t1 356
 	sw $t0 display($t1)
 	li $t1 364
 	sw $t0 display($t1)
 	li $t1 376
 	sw $t0 display($t1)
 	
	li $t1 396
 	sw $t0 display($t1)
 	li $t1 412
 	sw $t0 display($t1)
 	li $t1 440
 	sw $t0 display($t1)
 	
 	li $t1 452
 	sw $t0 display($t1)
 	li $t1 468
 	sw $t0 display($t1)
 	li $t1 476
 	sw $t0 display($t1)
 	li $t1 480
 	sw $t0 display($t1)
 	li $t1 488
 	sw $t0 display($t1)
 	li $t1 496
 	sw $t0 display($t1)
 	li $t1 500
 	sw $t0 display($t1)
 	li $t1 504
 	sw $t0 display($t1)
 	
 	li $t1 520
 	sw $t0 display($t1)
 	li $t1 524
 	sw $t0 display($t1)
 	li $t1 528
 	sw $t0 display($t1)
 	li $t1 532
 	sw $t0 display($t1)
 	li $t1 608
 	sw $t0 display($t1)
 	li $t1 616
 	sw $t0 display($t1)
 	li $t1 620
 	sw $t0 display($t1)
 	li $t1 628
 	sw $t0 display($t1)
 	
 	li $t1 648
 	sw $t0 display($t1)
 	li $t1 656
 	sw $t0 display($t1)
 	li $t1 664
 	sw $t0 display($t1)
 	
 	li $t1 728
 	sw $t0 display($t1)
 	li $t1 736
 	sw $t0 display($t1)
 	li $t1 740
 	sw $t0 display($t1)
 	li $t1 748
 	sw $t0 display($t1)
 	li $t1 752
 	sw $t0 display($t1) 
 		
 	li $t1 772
 	sw $t0 display($t1)
 	li $t1 792
 	sw $t0 display($t1)
 	li $t1 800
 	sw $t0 display($t1)
 	li $t1 816
 	sw $t0 display($t1)
 	li $t1 820
 	sw $t0 display($t1)
 	
 	li $t1 840
 	sw $t0 display($t1)
 	li $t1 848
 	sw $t0 display($t1)
 	li $t1 852
 	sw $t0 display($t1)
 	li $t1 856
 	sw $t0 display($t1)
 	li $t1 864
 	sw $t0 display($t1)
 	li $t1 872
 	sw $t0 display($t1)
 	
 	li $t1 936
 	sw $t0 display($t1)
 	li $t1 940
	sw $t0 display($t1)
 	
 	
 	#PERSONAJE (Posiciï¿½n inicial)
 	li $s0 68
	sw $t4 display($s0)
	
	#ENEMIGO (Posiciï¿½n inicial)
	li $s1 924
	sw $t5 display($s1)
	
	#ENEMIGO (Posiciï¿½n inicial)
	li $s2 868
	sw $t5 display($s2)
	
	#ENEMIGO (Posiciï¿½n inicial)
	li $s3 296
	sw $t5 display($s3)
	
	#ENEMIGO (Posiciï¿½n inicial)
	li $s4 624
	sw $t5 display($s4)
	
	#META (Final del mapa)
	li $t1 956
	sw $t7 display($t1)

 
 	#moneda1(Posicion inicial)
GenenerarMoneda1:
	li $v0 42
       	li $a0 0
       	li $a1 256
       	syscall
       	mult $a0, $t3
       	mflo $a0
       	la  $t9, display($a0)     				 
	lw $t9, 0($t9) 	
       	beq $t0, $t9, GenenerarMoneda1
       	beq $t4, $t9, GenenerarMoneda1
       	beq $t5, $t9, GenenerarMoneda1
       	beq $t7, $t9, GenenerarMoneda1
     

PintarMoneda1:
	sw $t6 display($a0)
	j GenenerarMoneda2
	
GenenerarMoneda2:
	li $v0 42
       	li $a0 0
       	li $a1 256
       	syscall
       	mult $a0, $t3
       	mflo $a0
       	la  $t9, display($a0)     				 
	lw $t9, 0($t9) 	
       	beq $t0, $t9, GenenerarMoneda2 
       	beq $t4, $t9, GenenerarMoneda2
       	beq $t5, $t9, GenenerarMoneda2
       	beq $t7, $t9, GenenerarMoneda2
     

PintarMoneda2:
	sw $t6 display($a0)
	j GenenerarMoneda3
	
GenenerarMoneda3:
	li $v0 42
       	li $a0 0
       	li $a1 256
       	syscall
       	mult $a0, $t3
       	mflo $a0
       	la  $t9, display($a0)     				 
	lw $t9, 0($t9) 	
       	beq $t0, $t9, GenenerarMoneda3 
       	beq $t4, $t9, GenenerarMoneda3
       	beq $t5, $t9, GenenerarMoneda3
       	beq $t7, $t9, GenenerarMoneda3
     

PintarMoneda3:
	sw $t6 display($a0)
	j GenenerarMoneda4
	
GenenerarMoneda4:
	li $v0 42
       	li $a0 0
       	li $a1 256
       	syscall
       	mult $a0, $t3
       	mflo $a0
       	la  $t9, display($a0)     				 
	lw $t9, 0($t9) 	
       	beq $t0, $t9, GenenerarMoneda4 
       	beq $t4, $t9, GenenerarMoneda4
       	beq $t5, $t9, GenenerarMoneda4
       	beq $t7, $t9, GenenerarMoneda4
     

PintarMoneda4:
	sw $t6 display($a0)
	j GenenerarMoneda5
	
GenenerarMoneda5:
	li $v0 42
       	li $a0 225
       	li $a1 233
       	syscall
       	mult $a0, $t3
       	mflo $a0
       	la  $t9, display($a0)     				 
	lw $t9, 0($t9) 	
       	beq $t0, $t9, GenenerarMoneda5 
       	beq $t4, $t9, GenenerarMoneda5
       	beq $t5, $t9, GenenerarMoneda5
       	beq $t7, $t9, GenenerarMoneda5
     

PintarMoneda5:
	sw $t6 display($a0)
	j teclado


	
	
       	
       	
#############################    MOVIMIENTO DEL PERSONAJE   #############################  
 teclado:
 	#Adquiere la tecla para hacer el movimiento
 	li $v0, 12	
 	syscall
 	move $t3, $v0
 	
	#Teclas para el movimiento (tomando en cuenta letras mayï¿½sculas en el input)

 	beq	$t3, 100, derecha	# el personaje se mueve a la derecha si la tecla es 'd' 
 	beq	$t3, 68, derecha	# el personaje se mueve a la derecha si la tecla es 'D' 
	beq	$t3, 97, izquierda	# el personaje se mueve a la izquierda si la tecla es 'a' 
	beq	$t3, 65, izquierda	# el personaje se mueve a la izquierda si la tecla es 'A' 
	beq	$t3, 119, arriba	# el personaje se mueve hachia arriba si la tecla es 'w'
	beq	$t3, 87, arriba		# el personaje se mueve hacia arriba si la tecla es 'W' 
	beq	$t3, 115, abajo		# el personaje se mueve hacia abajo si la tecla es 's'
	beq	$t3, 83, abajo		# el personaje se mueve hacia abajo si la tecla es 'S'
 	j teclado 	#Retorna nuevamente la funciï¿½n de movimiento
 	
 	#MOVIMIENTO HACIA LA DERECHA
 	derecha:  	
 	addi $t1, $s0, 4 	 #Hace la suma de bits necesarios para el movimiento deseado de pixeles
 	j movimiento
         
  	#MOVIMIENTO HACIA LA IZQUIERDA        
	izquierda: 
 	addi $t1, $s0, -4 	
	j movimiento
	
 	#MOVIMIENTO HACIA ARRIBA    
 	arriba: 
 	addi $t1, $s0, -64 	
 	j movimiento
         
        #MOVIMIENTO HACIA ABAJO    
        abajo:
 	addi $t1, $s0, 64 
 	j movimiento
 	
 	#FUNCIï¿½N QUE HACE POSIBLE EL MOVIMIENTO
 	movimiento:
 	la  $t9, display($t1)    # Obtiene el color de los pixeles a los que se estï¿½ moviendo, es decir, si se mueve a un camino 
 				 #obtiene el marrï¿½n y si se mueve a una pared obtiene el verde 
	lw $t9, 0($t9) 		 #Carga el cï¿½digo del color dentro del mismo registro

	
	beq $t0, $t9, teclado 	#hace que si choca con una pared no se mueva y vuelva a pedir tecla para el movimiento
	beq $t5, $t9, perder #Si el color a donde se estï¿½ moviendo es igual al del enemigo pierdes
	sw $t8 display($s0) #Hace que el color del espacio donde estaba sea el color del camino, simulando que se moviï¿½
	sw $t4 display($t1) #Se colorea al personaje en el nuevo bloque
	beq $t6, $t9, sumarPunto
	beq $t7, $t9, ganar #si el color a donde se estï¿½ moviendo es el de la meta se gana
	move $s0, $t1 #Indica la posiciï¿½n nueva del jugador
	j enemigos 	#Retorna nuevamente la funciï¿½n de movimiento
	
	
	
#############################    MOVIMIENTO DEL ENEMIGO   #############################  
#Se crea un movimiento tal como el del jugador para cada uno de los enemigos, en este caso son 4
enemigos:
	enemigo1:	
	li $v0 42
       	li $a0 0 
       	li $a1 4
       	syscall
       	move $t1, $a0	
	
	beq	$t1, 0, derecha_enemigo		# el enemigo se mueve a la derecha si el nï¿½mero es 0
 	beq	$t1, 1, izquierda_enemigo	# el enemigo se mueve a la izquierda si el nï¿½mero es 1
	beq	$t1, 2, arriba_enemigo		# el enemigo se mueve a la arriba si el nï¿½mero es 2
	beq	$t1, 3, abajo_enemigo		# el enemigo se mueve a la abajo si el nï¿½mero es 3
	
	#MOVIMIENTO HACIA LA DERECHA
 	derecha_enemigo:  	
 	addi $t1, $s1, 4 	 #Hace la suma de bits necesarios para el movimiento deseado de pixeles
 	j movimiento_enemigo
         
  	#MOVIMIENTO HACIA LA IZQUIERDA        
	izquierda_enemigo: 
 	addi $t1, $s1, -4 	
	j movimiento_enemigo
	
 	#MOVIMIENTO HACIA ARRIBA    
 	arriba_enemigo: 
 	addi $t1, $s1, -64 	
 	j movimiento_enemigo
         
        #MOVIMIENTO HACIA ABAJO    
        abajo_enemigo:
 	addi $t1, $s1, 64 
 	j movimiento_enemigo
	
	movimiento_enemigo:
 	la  $t9, display($t1)    
	lw $t9, 0($t9) 		 
	beq $t0, $t9, enemigo1 	
	beq $t7, $t9, enemigo1	
	beq $t6, $t9, enemigo1
	sw $t8 display($s1) 
	sw $t5 display($t1)
	beq $t4, $t9, perder 
	move $s1, $t1 
	j enemigo2 	
	
	enemigo2:	
	li $v0 42
       	li $a0 0 
       	li $a1 4
       	syscall
       	move $t1, $a0	
	
	beq	$t1, 0, derecha_enemigo2	# el enemigo se mueve a la derecha si el nï¿½mero es 0
 	beq	$t1, 1, izquierda_enemigo2	# el enemigo se mueve a la izquierda si el nï¿½mero es 1
	beq	$t1, 2, arriba_enemigo2		# el enemigo se mueve a la arriba si el nï¿½mero es 2
	beq	$t1, 3, abajo_enemigo2		# el enemigo se mueve a la abajo si el nï¿½mero es 3
	
	#MOVIMIENTO HACIA LA DERECHA
 	derecha_enemigo2:  	
 	addi $t1, $s2, 4 	 #Hace la suma de bits necesarios para el movimiento deseado de pixeles
 	j movimiento_enemigo2
         
  	#MOVIMIENTO HACIA LA IZQUIERDA        
	izquierda_enemigo2: 
 	addi $t1, $s2, -4 	
	j movimiento_enemigo2
	
 	#MOVIMIENTO HACIA ARRIBA    
 	arriba_enemigo2: 
 	addi $t1, $s2, -64 	
 	j movimiento_enemigo2
         
        #MOVIMIENTO HACIA ABAJO    
        abajo_enemigo2:
 	addi $t1, $s2, 64 
 	j movimiento_enemigo2
	
	movimiento_enemigo2:
 	la  $t9, display($t1)   
	lw $t9, 0($t9) 		 
	beq $t0, $t9, enemigo2 
	beq $t7, $t9, enemigo2
	beq $t6, $t9, enemigo2
	sw $t8 display($s2) 
	sw $t5 display($t1)
	beq $t4, $t9, perder 
	move $s2, $t1 
	j enemigo3 	
	
	enemigo3:	
	li $v0 42
       	li $a0 0 
       	li $a1 4
       	syscall
       	move $t1, $a0	
	
	beq	$t1, 0, derecha_enemigo3	# el enemigo se mueve a la derecha si el nï¿½mero es 0
 	beq	$t1, 1, izquierda_enemigo3	# el enemigo se mueve a la izquierda si el nï¿½mero es 1
	beq	$t1, 2, arriba_enemigo3		# el enemigo se mueve a la arriba si el nï¿½mero es 2
	beq	$t1, 3, abajo_enemigo3		# el enemigo se mueve a la abajo si el nï¿½mero es 3
	
	#MOVIMIENTO HACIA LA DERECHA
 	derecha_enemigo3:  	
 	addi $t1, $s3, 4 	 #Hace la suma de bits necesarios para el movimiento deseado de pixeles
 	j movimiento_enemigo3
         
  	#MOVIMIENTO HACIA LA IZQUIERDA        
	izquierda_enemigo3: 
 	addi $t1, $s3, -4 	
	j movimiento_enemigo3
	
 	#MOVIMIENTO HACIA ARRIBA    
 	arriba_enemigo3: 
 	addi $t1, $s3, -64 	
 	j movimiento_enemigo3
         
        #MOVIMIENTO HACIA ABAJO    
        abajo_enemigo3:
 	addi $t1, $s3, 64 
 	j movimiento_enemigo3
	
	movimiento_enemigo3:
 	la  $t9, display($t1)    
	lw $t9, 0($t9) 		 
	beq $t0, $t9, enemigo3 	
	beq $t7, $t9, enemigo3
	beq $t6, $t9, enemigo3
	sw $t8 display($s3) 
	sw $t5 display($t1)
	beq $t4, $t9, perder 
	move $s3, $t1 
	j enemigo4 	
	
	enemigo4:	
	li $v0 42
       	li $a0 0 
       	li $a1 4
       	syscall
       	move $t1, $a0	
	
	beq	$t1, 0, derecha_enemigo4	# el enemigo se mueve a la derecha si el nï¿½mero es 0
 	beq	$t1, 1, izquierda_enemigo4	# el enemigo se mueve a la izquierda si el nï¿½mero es 1
	beq	$t1, 2, arriba_enemigo4		# el enemigo se mueve a la arriba si el nï¿½mero es 2
	beq	$t1, 3, abajo_enemigo4		# el enemigo se mueve a la abajo si el nï¿½mero es 3
	
	#MOVIMIENTO HACIA LA DERECHA
 	derecha_enemigo4:  	
 	addi $t1, $s4, 4 	 #Hace la suma de bits necesarios para el movimiento deseado de pixeles
 	j movimiento_enemigo4
         
  	#MOVIMIENTO HACIA LA IZQUIERDA        
	izquierda_enemigo4: 
 	addi $t1, $s4, -4 	
	j movimiento_enemigo4
	
 	#MOVIMIENTO HACIA ARRIBA    
 	arriba_enemigo4: 
 	addi $t1, $s4, -64 	
 	j movimiento_enemigo4
         
        #MOVIMIENTO HACIA ABAJO    
        abajo_enemigo4:
 	addi $t1, $s4, 64 
 	j movimiento_enemigo4
	
	movimiento_enemigo4:
 	la  $t9, display($t1)    
	lw $t9, 0($t9) 		 
	beq $t0, $t9, enemigo4
	beq $t7, $t9, enemigo4
	beq $t6, $t9, enemigo4
	sw $t8 display($s4) 
	sw $t5 display($t1)
	beq $t4, $t9, perder 
	move $s4, $t1 
	j teclado 	
	
	
sumarPunto:
	addi $t2, $t2, 1
	j movimiento
	
perder:
	li $v0, 4         
    	la $a0, perdiste   
    	syscall
    	j terminar	

ganar:
	li $v0, 4         
    	la $a0, ganaste   
    	syscall
    	j puntaje
	
	
#############################    PUNTAJES DEL JUEGO    #############################    
puntaje: 	
#####################
	la $t9, ($t2)
	decimal:
	li $v0, 4         
    	la $a0, puntaje_decimal  
    	syscall
    	
	li $v0, 1        
    	move $a0, $t2     
    	syscall
    	  
    	 #######################################   	    	    	  	    	    	
	octal:
	li $t0, 8 #Numero con el que vamos a dividir
	li $t1, 0 #Numero donde vamos a guardar el resto
	li $t3, 32 #Nuestro puntero

	loop:
	blt $t2, $t0, endLoop
	
	div $t2, $t0
	mfhi $t1
	mflo $t2
	
	addi $t1, $t1, 48
	sb $t1, result($t3)
	
	subi $t3, $t3, 1
	b loop
	
	endLoop:
	addi $t2, $t2, 48
	sb $t2, result($t3)
	li $t5, 32
		addSpace:
			subi $t3, $t3, 1
			sb $t5, result($t3)
			beqz $t3, resultado_octal
			b addSpace

	resultado_octal:
	li $v0, 4
	la $a0, puntaje_octal
	syscall
	
	li $v0, 4
	la $a0, result
	syscall
	
	###################################################3
	hexadecimal:
	main1:
	la $t2, ($t9)
	li $t0, 20 #Nuestro índice para movernos
	li $t1, 16 #Numero con el que vamos a dividir
	li $t3, 0 #Nuestro cociente
	
	loop1:
		blt $t2, $t1, endLoop1
		
		div $t2, $t1
		mfhi $t3
		mflo $t2
		
		bgt $t3, 9, isLetter1
		
		addi $t3, $t3, 48
		sb $t3, resultado1($t0)
		subi $t0, $t0, 1
		b loop1
	
	isLetter1:
		addi $t3, $t3, 55
		sb $t3, resultado1($t0)
		
		subi $t0, $t0, 1
		b loop1
	
	endLoop1:
		bgt $t2, 9, isLetter2
		addi $t2, $t2, 48
		sb $t2, resultado1($t0)
		li $t4, 32
			addSpace1:
				subi $t0, $t0, 1
				sb $t4, resultado1($t0)
				beqz $t0, resultado_hexadecimal
				b addSpace1
	
	isLetter2:
		addi $t2, $t2, 55
		sb $t2, resultado1($t0)
		li $t4, 32
		b addSpace1

resultado_hexadecimal:
	li $v0, 4
	la $a0, puntaje_hexadecimal
	syscall
	
	li $v0, 4
	la $a0, resultado1
	syscall
	
	#####################################
	
	binario:
	la $t2, ($t9)
	li $t0, 2 #Nuestro contador para movernos
li $t1, 32 #Contador para moverme

loop2:
	blt $t2, $t0, endLoop3
	div $t2, $t0
	
	mfhi $t3
	mflo $t2
	
	addi $t3, $t3, 48
	sb $t3, result2($t1)
	
	subi $t1, $t1, 1
	b loop2
	
endLoop3:
	addi $t2, $t2, 48
	sb $t2, result2($t1)
	li $t4, 32
		addSpace2:
			subi $t1, $t1, 1
			sb $t4, result2($t1)
			beqz $t1, result2ado_binario
			b addSpace2

result2ado_binario:
	li $v0, 4
	la $a0, puntaje_binario
	syscall
	
	li $v0, 4
	la $a0, result2
	syscall
	j terminar


		
terminar:
	li $v0 10
	syscall
         
