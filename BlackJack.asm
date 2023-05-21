; -----------------------------------------------
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
xor dx,dx ;
mov cx, 11
div cx

add dl, '0'

mov randomNum, dl

sub dl, 47

mov randomNum, dl

push dword ptr [randomNum] ; pasar el valor sum como argumento a printf
push offset fmt ; pasar el formato como argumento a printf

call printf ; llamar a printf para imprimir el valor de eax
push 0
call exit ; salir del programa





main endp
end