##################################################
# Busmonitor mit graphischem Ausgang             #
##################################################

Autor: Andreas H�mmer <andreas.huemmer@andreashuemmer.de>

(c) 2008, 2009 by Andreas H�mmer

Bereitgestellt unter der GPL 2.0, Teile der Soft oder Hardware
k�nnen anderen Lizenzen unterliegen.

Beschreibung:
Jedes mal einen Computer oder Laptop mit sich rum zu tragen, wenn ein Problem auf dem EIB/KNX System
auftritt erschien mir etwas Oberkill, obglich das Problem in Zeiten billiger Laptops nicht mehr ganz
so schlimm erscheint. Also war die Frage ob es eine M�glichkeit gibt eine grphische Ausgabe eines 
MC zu erhalten, die sich direkt auf einem Bildschirm darstellen l�sst, ohne dass es hierzu ein ent-
sprechendes Computer(Terminal) braucht. Nach einigem Suchen und einiger interessanten F�nde kam ich 
schlicht auf ein System von viebig-datentechnik, welches nicht nur als Version f�r VGA-Ausgabe sondern
auch als Version f�r TV Ausgabe via Comomposit oder SCART in Farbe bzw. SW zur Verf�gung steht. Ach ja, 
die Ansteuerung der "Graphikkarte" (letzlich auch nur ein entsprechend programmierter MC) erfolgt komplett
�ber die RS232. Dar�ber hinaus bietet dass kleine Teil noch die m�glichkeit eine standard PS/2 Tastatur
anzuschlie�en.

Als ersten Gedanken hatte ich vor das serielle-Interface hierf�r zu verwenden, kam dann aber wieder von 
ab und gehe von der aktuellen LPC-Controllerplatine 4.43 als Grundlage aus. Das Serielle Signal kann hier
direkt von der ISP Stiftleiste abgeleitet werden.

Bilder und Details demn�chst auf http://www.adminsend.de

Denkbare Versionen:
EIB Busmonitor mit VGA oder Videoausgang
I2C Busmonitor mit VGA oder Videoausgang
EIB Anzeigeeinheit (Bar-graph Funktion des Videotreibers)
Embedded oder Standaloneversion f�r den Mobilen Einsatz
Variation mit LCD ode LED Display

Status:
19.12.2009
v 0.01	Prototypenlayout Grundschaltung
					TODO
					- stabilisierug der RS232 �bertragungspegel
					- Autonome Spannungsversorgung
					- Pr�fen ob der LPC genug Rechneleistung hat
					- Umsetzung EIB in ESC Sequenzen f�r die Displayansteuerung
					- Geh�usesuche
					