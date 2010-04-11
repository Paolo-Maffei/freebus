Ziel dieses Freebus Projektes ist es, KNX-RF kompatible Funkmodule zu bauen,
die über ein TP-RF Interface mit dem drahtgebundenen freebus zusammenarbeiten
-----------------------------------------------------------------------------

Als Quellen zu KNX-RF dienten mir:

Joost Demarest , Wireless congress Nov2005
http://www.carontenet.it/approfondimenti/matdomotica/orgknx/knx_rf_joost_demarest.pdf

das Buch
KNX, EIB für die Gebäudesystemtechnik in Wohn- und Zweckbau
Werner Kriesel ; Frank Sokollik ; Peter Helm.
Hüthig Verlag

http://www.weinzierl.de/download/KnxRf_Paper_D.pdf

https://www.auto.tuwien.ac.at/LVA/HGA/stp/abinger.pdf

https://www.auto.tuwien.ac.at/downloads/knxsci06/reinisch-wireless-knxsci06-website.pdf

Als Funk-Hardware nehme ich den RFM22B (in der 868MHz Version) von hoperf.com
Der ältere, bekanntere RFM12 unterstützt nicht die KNX-RF chiprate, und hat auch
unbefriedigende Reichweite.

Vergleich der KNX-RF Spec mit den Daten des RFM22
-------------------------------------------------

                  KNX/RF spec           RFM22
                  -----------           ------
Center Frequency  868.3 MHz             868.3 MHz
Frequ tolerance   +/-35ppm              ? feinabgleich ist möglich
FSK deviation     +/-40kHz to +/-80kHz  ist so einstellbar, ich nehme +/-60kHz
Rx Bandwidth      300kHz                nicht vergleichbar
Rx Sensitivity    -95dB typ.            -118dB (also wesentlich besser)
Chiprate          32.768kHz             32.77 kHz

Tx minimum ERP    0dBm                  +17dBm (auch wesentlich besser)


ERP = Effective radiated power
    = effektive Sendeleistung Sendeleistung,
      0dBm entspricht 1mW. 
     14dBm = 25mW, das ist maximal auf der Frequenz erlaubt.
     Wenn man davon ausgeht, dass die Antenne nicht optimal gestaltet ist,
     und mindestens 3dB verliert, darf man wohl auch 17dB einstellen

Manchester Codierung:
    Prinzipiell unterstützt der RFM22 sie.
    Aber: KNX-RF protokoll hat hinter der Preambel eine "Manchester Violation".
    Die wird nicht unterstützt. Also mache ich die Manchester Codierung /
    Decodierung per software mit dem controller. Die Manchester Violation
    betrachte ich als teil des "sync" wortes.

CRC:
    auch hier Radio Eriwan: im prinzip ja.
    RFM22 kennt einige standard CRC Polynome, nicht jedoch das von KNX-RF.
    Daher mache ich auch das CRC mit dem controller.

Spezifikation unklar in folgenden Punkten:
------------------------------------------
1.) Bitreihenfolge. LSB-MSB oder MSB-LSB?

RFM22 kann beides. KNX-TP verwendet LSB-MSB.

der CRC Rechner http://zorc.breitbandkatze.de/crc.html fängt offenbar
beim MSB an. Dazu passt auch die Anordnung der CRC bytes im KNX Telegramm
(Hi byte - Lo byte). Ich gehe daher davon aus, dass KNX-RF MSB-LSB verwendet
und implementiere es (erstmal?) so.

2.) AN067 (ti.com) seite 9: final CRC complemented. Das gilt für MBUS.
    gilt das auch für KNX-RF?

Besonderheiten RF verglichen mit TP
-----------------------------------
Keine Kollisionserkennung. Das ist bei FSK einfach nicht möglich.

Kein Acknowledge auf Link Level. Optional kann ACK im Applikation Layer implementiert werden.
Siehe https://www.auto.tuwien.ac.at/downloads/knxsci06/reinisch-wireless-knxsci06-website.pdf
Seite 8. Zitat:
KNX RF does not use link layer acknowledgments for a couple of reasons.
First of all, transmit-only devices would not be able to receive acknowledgments.
Also, acknowledgments would have to include a unique identification of their sender
to be meaningful. This applies to multicasts in particular, but also in general
since on an open medium data frames and acknowledgments of multiple individual
transmissions may be mixed up. Instead of adding this overhead, KNX RF suggests
implementing end-to-end acknowledgments at the application level where required.

Hardware
--------
eagle Dateien und Fotos
 SVN: hardware/ideas/funkmodul

Im derzeitigen (Q1/2010) Versuchsaufbau habe ich einen ATMEGA168P
mit einem RFM22 verwurstet, das Ganze ist als Steckmodul mit Pfostenstecker ausgeführt,
man kann es auf ein Steckbrett setzen oder das Drumherum (app-board)
zunächst auf Lochraster aufbauen.
Zusätzlich sechspoliger Pfostentecker für das flashen der firmware (ISP).
Der AVR hat keinen eigenen Quarz. Den clock liefert der RFM22 (10MHz).

Antennenanschluss
-----------------
 ist für SMA oder SMB Buchse ausgelegt, ich verwende einfach 2 Stück 8cm lange Drahtstücke,
 die in entgegengesetzte Richtungen weisen.

Versorgung
----------
Achtung! Kein Spannungsregler auf dem Funkmodul vorhanden!
3 Volt reichen, z.B. 2 AA Primärzellen oder 3 NiMH AA-Akkus (3*1.2V=3.6V)
oder ein entsprechendes Netzteil, oder ein Spannungsregler auf Lochraster,
oder oder ... Nur nicht wesentlich mehr als 3.6 V anlegen!!! Sonst RFM22 tot.

Interface zum TP-freebus ( TP=twisted pair)
---------------------------
ist noch nicht realisiert. Alle zeitkritischen Dinge im RF werden vom RFM22 selbstständig abgewickelt. Daher kann der controller auch noch den TP bus parallel bedienen. Allerdings sind die pins
 PD2/INT0   (EIB_IN) und 
 PD4/XCK/T0 (EIB_OUT) beim Funkmodul schon anderweitig verwendet.
Hier können in der endgültigen Version andere pins benutzt werden:
Der RFM22 interrupt kann später über PD3/INT1 entgegengenommen werden,
und SDN vom RFM22 (PD4) wird bisher sowieso nicht verwendet....

Allerdings:
Als EIB_OUT würde ich lieber einen der pins OC0A, OC0B, OC1A usw verwenden.
Die schalten hardwaregesteuert wenn der Timer den eingestellten Wert
erreicht, ohne zusätzliche interrupt-Latenzzeit (wichtig wenn RF z.B.
gerade einen INT1 abarbeitet, da bekommt man unbekannte Latenzzeiten).
Den Interrupt bekommt man trotzdem noch, da kann man dan die restlichen
Dinge machen, aber der pin wird erstmal Zeitgenau bedient!

Und für EIB_IN würde ich lieber den Input Capture des Timers 1 verwenden
(PB0/ICP1). Damit kann man die Abstände der Flanken messen, ebenfalls ohne interrupt-Latenz.
Den Interrupt beim Telegrammstart bekommt man damit auch.

Für RF wird TIMER2 verwendet. Kann aber auf TIMER0 geändert werden.
Ich hoffe, einer von beiden wird von TP-firmware nicht benutzt.

Blinkenlights
-------------
Man kann LEDs anschliessen, die Sendung und Empfang anzeigen.
Momentan verwende ich PD6 (nur eine LED für beides).
Der pin (die pins) dafür sind in fbrf_hal.h definiert.

Firmware
--------
SVN software/avr/rf/

Sie kann bisher (hoffentlich) KNX-RF konforme Telegramme senden und empfangen.
Wenn das Modul senden soll, ist pin PC0 auf GND zu legen, andernfalls auf VDD.
Es wird ca. alle 1.5 sekunden ein Telegramm gesendet. Der Inhalt des Telegramms
ist noch fix, in den Nutzlast-Bytes läuft mehrfach ein Zähler hoch.
CRC wird auf der Sendeseite schon gebildet, auf der Empfangsseite aber noch
nicht geprüft.
Das empfangene Telegramm wird über den USART mit 9600 8N1 ausgegeben.
In Byte 24 wird die Empfangsfeldstärke eingeblendet, in Schritten von 0.5dB.
Man kann über den USART auch direkt die Register des RFM22 ansprechen.
       Format: @xxyy.
       xx : register adresse vom RFM12 (hex)
            oberstes bit 0: lesen, 1: schreiben
       yy : Wert (hex)

Die Firmware basiert auf SVN software/atmega8, Stand ende 2009.
Die C-Module fb_hal.c, fb_prot.c usw waren damals noch für mich zugänglich.
Seitdem daraus eine lib gebaut wurde, wird sie nur noch für "wirklich aktive"
Leute freigegeben. Ich hoffe, durch den upload meiner firmware in die Riege
der "wirklich aktiven" aufgenommen zu werden. Ich nehme an, der Stand vom ende
2009 ist nicht der neueste... Die Kollisionserkennung ist da z.B. noch ausgeblendet..
Ich habe die entsprechenden C-files entsprechend fbrf_hal.c, fbrf_prot.c usw
getauft.

Quelltext-files entsprechen noch nicht den freebus regeln
  (tabs @ 4 spaces, doxygen doku, Kopf mit copyright etc)

Fuses
------
 für ATMEGA168P
efuse = 01
hfuse = DF
lfuse = E0

