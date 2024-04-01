# LED-Lesezeichen
Ein/Ausschalten: Zum Ein/Ausschalten die mit X markierten Punkte auf Vorder- und Rückseite leicht zusammendrücken.  


## Stromversorgung
Eine CR2016-Batterie. Kann durch vorsichtiges Entfernen des Klebebands an der Unterkante getauscht werden. Der Minuspol zeigt nach vorne, d.h. in die Richtung, in der die LEDs sichtbar sind. Obwohl Verpolung theoretisch für den Controller ok sein sollte, bitte nicht ausprobieren.  
  
Berechnete Batterielaufzeit: Eingeschaltet 5-10h, ausgeschaltet etwa 100 Jahre (durch Selbstentladung der Batterie kürzer).


## Hardware
Verbauter Microcontroller: Attiny44a in einem SOIC-Gehäuse. 
Clock Speed: 8MHz (intern).  
Kein BOD programmiert.  
12 LEDs charlieplexed an 4 Pins PORTA0-3, Arduino-Pins 0;1;2;3

## Code
Programmiert in AVR Assembler. 84 Bytes.
Die .hex Datei kann über ISP und AVRdude programmiert werden. Kompilieren z.B. über Microchip Studio.

