PrintString MACRO string
    lea dx, string
    mov ah, 09h
    int 21h
    
    ENDM

org 100h 


.DATA  

Msg_1 DB 10,13, 'For Addition type	      :	         1 $'
Msg_2 DB 10,13, 'For Subtraction type       :             2 $'
Msg_3 DB 10,13, 'For Multiplication type	: 	        3 $'
Msg_4 DB 10,13, 'For Division type          :  	       4 $'  
Msg_5 DB 10,13, 'For Modulus type           :	         5 $'

UserInput DB 10,13,10,13, 'Please choose anyone option	:	$' 

Input_1 DB 10,13,10,13, 'Enter your 1st number	:	$'
Input_2 DB 10,13, 'Enter your 2nd number	:	$'

Res DB 10,13,10,13, 'The result is		:	$' 

Msg DB 10,13,10,13,'               ***THANK YOU FOR USING MY APP***$'
                           
c db ?
x db ?
y db ? 
z db ?

.CODE 
MAIN PROC

MOV AX, @DATA
MOV DS, AX


    PrintString Msg_1
        
    PrintString Msg_2
    
    PrintString Msg_3
       
    PrintString Msg_4
       
    PrintString Msg_5
              
    PrintString UserInput
    
    
    MOV AH, 01H					;Take input for operation
    INT 21H
    MOV c, AL
    SUB c, 48
    
    CMP c,1
    JE ADD
    
    CMP c,2
    JE SUB
     
    CMP c,3
    JE MUL
    
    CMP c,4
    JE DIV  
    
    CMP c, 5
    JE  MOD
    
    

ADD:

PrintString Input_1           ;Enter 1st number

 mov ah, 01h
 int 21h  
 mov bl, al
 sub bl, 48
 
mov ah, 01h
int 21h 
mov x, al
sub x, 48  


mov al, bl
mov bl, 10
mul bl

add al, x
mov bl, al  
         
CALL  NewLine			;For new line
   
PrintString Input_2      ;Enter 2nd number

mov ah, 01h
int 21h
mov y, al
sub y, 48   

mov ah, 01h
int 21h
mov z, al
sub z, 48


mov al, y
mov y, 10
mul y

add al, z
mov z, al 


add bl, z					;Addition value

CALL  NewLine			;For new line

PrintString Res       ;For result 

mov ah, 0  
mov al, bl
mov bl, 100
div bl  

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov ah, 0  
mov al, bl
mov bl, 10
div bl  

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, bl 
add dl, 48
mov ah, 02h
int 21h

JMP blank
 
 

SUB:

PrintString Input_1       ;Enter 1st number

mov ah, 01h
int 21h   
 mov bl, al
 sub bl, 48
 
mov ah, 01h
int 21h 
mov x, al
sub x, 48  


mov al, bl
mov bl, 10
mul bl

add al, x
mov bl, al  
   
CALL NewLine        ;For new line 
   
PrintString Input_2       ;Enter 2nd number

mov ah, 01h
int 21h
mov y, al
sub y, 48   

mov ah, 01h
int 21h
mov z, al
sub z, 48


mov al, y
mov y, 10
mul y

add al, z
mov z, al 


sub bl, z			;Subtraction value

CALL NewLine          ;For new line

PrintString Res      ;For result

mov ah, 0  
mov al, bl
mov bl, 10
div bl  

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, bl 
add dl, 48
mov ah, 02h
int 21h

JMP blank

   

MUL:
  
PrintString Input_1            ;Enter 1st number


mov ah, 01h
int 21h  
 mov bl, al
 sub bl, 48
 
mov ah, 01h
int 21h 
mov x, al
sub x, 48  


mov al, bl
mov bl, 10
mul bl

add al, x
mov bl, al  

CALL  NewLine			;For new line
   
PrintString Input_2       ;Enter 2nd number

mov ah, 01h
int 21h
mov y, al
sub y, 48   

mov ah, 01h
int 21h
mov z, al
sub z, 48


mov al, y
mov y, 10
mul y

add al, z
mov z, al 

 
mov al, bl             
mul z
mov bl, al				;Multiplication value

CALL  NewLine

PrintString Res       ;For result 

mov ah, 0  
mov al, bl
mov bl, 100
div bl  

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov ah, 0  
mov al, bl
mov bl, 10
div bl  

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h

mov dl, bl 
add dl, 48
mov ah, 02h
int 21h
    
JMP blank



DIV:

PrintString Input_1       ;Enter 1st number

mov ah, 01h
int 21h  
 mov bl, al
 sub bl, 48
 
mov ah, 01h
int 21h 
mov x, al
sub x, 48  


mov al, bl
mov bl, 10
mul bl

add al, x
mov bl, al  
  
CALL  NewLine       ;For new line 
   
PrintString Input_2       ;Enter 2nd number

mov ah, 01h
int 21h
mov y, al
sub y, 48   

mov ah, 01h
int 21h
mov z, al
sub z, 48


mov al, y
mov y, 10
mul y

add al, z
mov z, al 


mov al, bl        
div z 
mov bl, al          ;Division value
              
CALL  NewLine       ;For new line 

PrintString Res      ;For result 

mov ah, 0
mov al, bl 
mov bl, 10
div bl
 
mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h 
 
mov dl, bl
add dl, 48
mov ah, 02h
int 21h

JMP blank



MOD:

PrintString Input_1       ;Enter 1st number

mov ah, 01h
int 21h  
 mov bl, al
 sub bl, 48
 
mov ah, 01h
int 21h 
mov x, al
sub x, 48  


mov al, bl
mov bl, 10
mul bl

add al, x
mov bl, al  
 
CALL NewLine         ;For new line
   
PrintString Input_2       ; Enter 2nd number

mov ah, 01h
int 21h
mov y, al
sub y, 48   

mov ah, 01h
int 21h
mov z, al
sub z, 48


mov al, y
mov y, 10
mul y

add al, z
mov z, al 


mov al, bl        
div z 
mov bl, ah          ;Modulus value
              
CALL NewLine         ;For new line

PrintString Res       ;For result

mov ah, 0
mov al, bl 
mov bl, 10
div bl

mov bl, ah
mov dl, al
add dl, 48
mov ah, 02h
int 21h 
  
mov dl, bl
add dl, 48
mov ah, 02h
int 21h


blank:
  
  main endp 



 NewLine PROC
    
    mov dx, 10              ;For new line
    mov ah, 02h
    int 21h
    mov dx, 13
    int 21h 
    
    RET
    NewLine ENDP



ret