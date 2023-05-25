;-----------------------------------------------
; UNIVERSIDAD DEL VALLE DE GUATEMALA
; Organización de computadoras y Assembler
; Ciclo 1 - 2023
;
; Nombre: BlackJack.asm
; Descripción: suma de dos números enteros e impresión
; de resultado en ventana de ejecución.
; Autor: Mod. por KB
;
; EAX: operando 2 de suma y destino resultado.
; printf: imprime res suma almacenado en eax
; ----------------------------------------------- */

.386
.model flat, stdcall, c
.stack 4096

includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn scanf:near
extrn exit:near

.data
banner0 BYTE "|_____________________________________________________________________|",0Ah,0
banner1 BYTE "|BBBBB   L       A     CCCC   KK  KK       JJJ    A     CCCC  KK  KK  |",0Ah, 0
banner2 BYTE "|B    B  L      A A   C       KK KK         J    A A   C      KK KK   |",0Ah,0
banner3 BYTE "|BBBBB   L     AAAAA  C       KKKK          J   AAAAA  C      KKKK    |",0Ah,0
banner4 BYTE "|B    B  L    A     A C       KK KK      J  J  A     A C      KK KK   |",0Ah,0
banner5 BYTE "|BBBBB   LLL A       A CCCC   KK  KK      JJ  A       A CCCC  KK  KK  |",0Ah,0
banner6 BYTE "|---------------------------------------------------------------------|",0Ah,0Ah,0

play BYTE "1: Jugar",0Ah,0
rules BYTE "2: Ver instrucciones",0Ah,0
salir BYTE "3: Terminar de jugar",0Ah,0Ah,0

num dd "%d",0

opcion BYTE "Opcion: ",0

opciones dd 0

msg BYTE "Dinero actual: %d",0Ah, 0
cash dd 3000

fmt BYTE "Numero random: %d",0Ah, 0
randomNum db 0


.code

public main
main proc

				;Impresión del banner
	push offset banner0
	call printf
	push offset banner1
	call printf
	push offset banner2
	call printf
	push offset banner3
	call printf
	push offset banner4
	call printf
	push offset banner5
	call printf
	push offset banner6
	call printf

Menu:
	push offset banner6
	call printf

	push offset play
	call printf

	push offset rules
	call printf

	push offset salir
	call printf

	push offset banner6
	call printf
						;Scan para seleccionar la opcion a realizar
	push offset opcion 
	call printf
	add esp, 4
	lea eax, [ebp-4]

	push eax 
	push offset num
	call scanf

	add esp, 8
	mov eax, [ebp-4]

	add esp, 8

jugar:

	call numRandom

	push dword ptr [randomNum] ; pasar el valor sum como argumento a printf
	push offset fmt ; pasar el formato como argumento a printf
	call printf ; llamar a printf para imprimir el valor de eax

	push dword ptr [cash]
	push offset msg
	call printf 


reglas:

terminar:
	push 0
	call exit ; salir del programa


main endp

;-------------------------------------------
;Subrutinas
;-------------------------------------------

;-----------------------------
;numRandom
;
;
;-----------------------------
	numRandom proc
	mov ax, dx ;Se mueve el registro dx al registro ax
	xor dx,dx ;
	mov cx, 11
	div cx

	add dl, '0'

	mov randomNum, dl

	sub dl, 47

	mov randomNum, dl
	ret
	numRandom endp

end