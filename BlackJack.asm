; -----------------------------------------------
; UNIVERSIDAD DEL VALLE DE GUATEMALA
; Organizaci�n de computadoras y Assembler
; Ciclo 1 - 2023
;
; Nombre: BlackJack.asm
; Descripci�n: Juego de Balck Jack en Assembler
; Autor: José Prince
;
; ----------------------------------------------- */

.386
.model flat, stdcall, c
.stack 4096

includelib libucrt.lib
includelib legacy_stdio_definitions.lib
includelib libcmt.lib
includelib libvcruntime.lib

extrn printf:near
extrn exit:near
extrn srand:near
extrn rand:near

.data

fmt db "Numero random: %d", 0
randomNum db 0

.code

public main
main proc
	
mov ax, dx ;Se mueve el registro dx al registro ax
xor dx,dx ;Compara que dx sea diferente de dx
mov cx, 11 ;Mueve a cx el valor de 11, este valor define el intervalo de 11 npumeros
div cx

add dl, '0'

mov randomNum, dl ;Mueve el registro dl a la variable randonNum

sub dl, 47 ;MOdifica el intervalo para que sea de 0 a 11

mov randomNum, dl

push dword ptr [randomNum] ; pasar el valor sum como argumento a printf
push offset fmt ; pasar el formato como argumento a printf

call printf ; llamar a printf para imprimir el valor de eax
push 0
call exit ; salir del programa

main endp
end