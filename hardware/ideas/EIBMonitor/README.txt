##################################################
# Busmonitor mit graphischem Ausgang             #
##################################################

Autor: Andreas Hümmer <andreas.huemmer@andreashuemmer.de>

(c) 2008, 2009 by Andreas Hümmer

Bereitgestellt unter der GPL 2.0, Teile der Soft oder Hardware
können anderen Lizenzen unterliegen.

Beschreibung:
Jedes mal einen Computer oder Laptop mit sich rum zu tragen, wenn ein Problem auf dem EIB/KNX System
auftritt erschien mir etwas Oberkill, obglich das Problem in Zeiten billiger Laptops nicht mehr ganz
so schlimm erscheint. Also war die Frage ob es eine Möglichkeit gibt eine grphische Ausgabe eines 
MC zu erhalten, die sich direkt auf einem Bildschirm darstellen lässt, ohne dass es hierzu ein ent-
sprechendes Computer(Terminal) braucht. Nach einigem Suchen und einiger interessanten Fünde kam ich 
schlicht auf ein System von viebig-datentechnik, welches nicht nur als Version für VGA-Ausgabe sondern
auch als Version für TV Ausgabe via Comomposit oder SCART in Farbe bzw. SW zur Verfügung steht. Ach ja, 
die Ansteuerung der "Graphikkarte" (letzlich auch nur ein entsprechend programmierter MC) erfolgt komplett
über die RS232. Darüber hinaus bietet dass kleine Teil noch die möglichkeit eine standard PS/2 Tastatur
anzuschließen.

Als ersten Gedanken hatte ich vor das serielle-Interface hierfür zu verwenden, kam dann aber wieder von 
ab und gehe von der aktuellen LPC-Controllerplatine 4.43 als Grundlage aus. Das Serielle Signal kann hier
direkt von der ISP Stiftleiste abgeleitet werden.

Bilder und Details demnächst auf http://www.adminsend.de

Denkbare Versionen:
EIB Busmonitor mit VGA oder Videoausgang
I2C Busmonitor mit VGA oder Videoausgang
EIB Anzeigeeinheit (Bar-graph Funktion des Videotreibers)
Embedded oder Standaloneversion für den Mobilen Einsatz
Variation mit LCD ode LED Display

Status:
19.12.2009
v 0.01	Prototypenlayout Grundschaltung
					TODO
					- stabilisierug der RS232 Übertragungspegel
					- Autonome Spannungsversorgung
					- Prüfen ob der LPC genug Rechneleistung hat
					- Umsetzung EIB in ESC Sequenzen für die Displayansteuerung
					- Gehäusesuche
					