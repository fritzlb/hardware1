;
; LesezeichenTiny44a.asm
;
; Created: 31.03.2024 21:23:45
; Author : Frederik
;

; registers: 
; r16 general purpose
; r0: mode

start:
	ldi r16, 0b0100_0000 ; Pull up resistors off for charlieplexing
	out MCUCR, r16
	
	lds r0, 0x0060 ; lade erste SRAM Adresse in R0, wobei r0 mode speichert
    inc r0 ; beim Start um einen erhöhen
	sts 0x0060, r0 ; zurückspeichern
    
	clr r1 
	inc r1 ; r1 ist nun 1
	cp r1, r0 ; wenn r0 = r1 (also 1)
	breq sleepmode ; go to sleep

	inc r1 ;r1 ist nun 2
	cp r1, r0
	breq ledson

	; handle overflow
	clr r0
	rjmp start

sleepmode:
	ldi r16, 0b0000_0000 
	out ADCSRA, r16 ; ACD off
	ldi r16, 0b1000_0000
	out ACSR, r16 ; analog comparator off
	ldi r16, 0b0111_0000 ; sleep enable, sleep mode select
	out MCUCR, r16
	sleep

	rjmp sleepmode ; prevent further code execution


ledson:
	ldi r16, 0b00001111 ;set all out
	out DDRA, r16

pwmallon:
	ldi r16, 0b0000_0001
	out PORTA, r16
	ldi r16, 0b0000_0010
	out PORTA, r16
	ldi r16, 0b0000_0100
	out PORTA, r16
	ldi r16, 0b0000_1000
	out PORTA, r16
	; nothing (make leds dimmer)
	ldi r16, 0b0000_0000
	out PORTA, r16

	clr r16
	do_nothing:
		inc r16
		nop
		cpi r16, 35
		brne do_nothing

	rjmp pwmallon