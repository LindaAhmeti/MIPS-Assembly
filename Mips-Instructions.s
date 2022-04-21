.text
.globl main


main:  la $a0 , cout               #e shfaq mesazhin qe dojm me paraqit
       syscall

      #j largest                  #Thirr funskionin largest()



largest:    addi $t0,$t0, 0        # i=0      
            addi $t3,$t3,5         # n=5
            
            j loop                 #Kalo në loop
            
            
loop:   addi $t0,$t0,1             #i++
        beq $t0 , $t3 , Shtypmax   #Nëse i = n, del prej loop dhe shtype vleren max

      la $s0, arr              #Merr prej memories vargun
      lw $t1 , 0($s0)           #max=arr[0]
      
        
      add $t5, $t0, $t0  	# Llogarit 2i dhe e vendos ne $t5 = një pjese e offset-it
      add $t5, $t5, $t5 	# Llogarit 4i qe i bie 4 bajt $t5=komplet offset-i i elementit te i-te
       
      add $t5, $t5, $s0	        # Adresojme arr[i] ne $t5
      lw $t6, 0($t5)	

      slt $t7 , $t1 , $t6       # Krahason antaret e vargut nëse jane më të mëdhenj se vlera qe u rujte te max
      beq $t7 , $zero , loop     # Nëse t7 ka vleren 0 perseritet loop
      addi $t1 , $t6 , 0         # Nëse plotesohet kushti atëhere ajo vlere është numri max dhe vendoset në t1
      
      j loop                     #Kalon te loop deri sa te përfundon krahasimin me krejt anetarët


Shtypmax: 
      add $a0 , $t1 , $zero          #$t1 që është vlera max e vendos te $a0 
      addi $v0 , $zero, 1            
      syscall 

      li $v0 , 10              #Mbyll programin
      syscall
     


     .data  # Ketu i kemi të gjitha te dhenat e programit tone

cout:  .asciiz "Largest in given array is :"
arr: .word 10 , 324 , 45 , 90 , 9808
