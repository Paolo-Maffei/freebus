Dies ist der Anfang meines freebus Funk Moduls.
-------------------------------------------------
um genau zu sein, es ist ein Funkmodul mit dem ich
von meinem Haus aus mit dem Bewegungsmelder am Grundstückseingang
kommuniziere. Dort habe ich nur Strom, sonst nichts, und der
Melder schaltet wie üblich eine Lampe.
Per Funk schalte ich zusätzlich die Lampe an der Haustür,
und vom Haus aus kann ich auch die Lampe beim Melder einschalten.
Das ganze arbeitet mit RFM12+AVR auf beiden Seiten.

Ich verwende z. Zt. ein "selbsterfundenes" Protokoll, mit Quittung.

Diese "Standalone" Lösung will ich in ein Gesamtsystem einbinden.
freebus scheint mir genau das Richtige.
Nach Sichtung der entsprechenden Doku (z.B. Weinzierl) möchte ich ein
KNX-RF kompatibles System aufbauen (oder zumindest anstreben),
mit RFM12, oder besser gleich RFM22. Im Haus dann ein Koppler
zum twisted pair freebus.

Die eagle-files und fotos zeigen das RFM12-AVR board wie ich es z.Zt.
in Betrieb habe. Über die Stiftleisten stecke ich es auf das
"Applikationsboard", welches noch auf Lochraster aufgebaut ist.
Der 6-polige Pfosten ist für ISP.

Mit RFM12 kann man wahrscheinlich ein KNX-RF kompatibles Signal senden
und empfangen. Zu KNX-RF siehe z.B.
http://www.carontenet.it/approfondimenti/matdomotica/orgknx/knx_rf_joost_demarest.pdf

RFM12 unterstützt allerdings nicht die Chiprate (32,768kHz).
Daher muss der serielle Datenstrom direkt vom controller erzeugt
bzw decodiert werden. Daher der zusätzliche Draht, der auf den Fotos zu
sehen ist, er verbindet den FSK/DATA pin vom RFM mit einem AVR port.
Mit der Reichweite des RFM12 kann es schon ein Problem geben.
Innerhalb einer Wohnung / Haus wird es gehen (evtl Problem mit
Stahlbeton), aber meinen 50m entfernten Melder erreiche ich nur
mit einer "richtigen" Antenne (groundplane).

RFM22 scheint die Chiprate zu unterstützen, und wird auch eine deutlich
bessere Reichweite haben.

Daten zu RFM12 und RFM22 : hoperf.com .

