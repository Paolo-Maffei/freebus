RFID Reader Application

Dies ist mein erster Vorschlag in Sachen RFID Reader.

Er basiert auf dem OEM Modul OEM-SR/MR 232 der Firma RSS-Systems ( www.rss-systems.de). 
Das Modul lie�t Tags aus bis zu 30 cm Entfernung und gibt die Tag Nummer als 10 ASCII Ziffern �ber RS232 aus.
Es kostet 24 � so dass ich einen Selbstbau f�r nicht lohnenswert halte.

Der FREEBUS Controller soll die Ziffern empfangen und mit einer Liste seiner bekannten Tags vergleichen.
Bei �bereinstimmung wird die Listennummer ( = User Nummer ) �ber EIB gesendet und optional ein Relais
f�r T�r�ffner etc. aktiviert.

F�r die Transponderverwaltung habe ich eine 2-stellige 7Segment Anzeige und 2 Taster geplant.
Den ersten Entwurf mit Ansteuerung �ber HC595 und Multiplexing habe ich verworfen, da ich im Forum die
Diskussion �ber zeitkritische Routinen beim EIB Empfang gelesen habe und nicht absch�tzen kann, wieviel Resourcen
ich damit verbrauchen w�rde.
Also eine I2C L�sung, die f�r den Controller komfortabel zu bedienen ist.
Die Anzeige sitzt auf einer kleinen Platine, ganz oben im HUT Geh�use. Der Deckel des Geh�uses wird gegen eine rote 
Kunststoffscheibe getauscht. ( http://cgi.ebay.de/ws/eBayISAPI.dll?ViewItem&item=350257453094&ssPageName=STRK:MEWAX:IT)
Die Verbindung zur gro�en Platine erfogt �ber einen IC Sockel Steckverbinder, weil der regul�re Pfostenstecker zu hoch ist.

Bei Empfang wird die Transpondernummer �ber die LEDs angezeigt.
Die Anzugszeit des Relais ist parametrierbar

Programmierung

Ben�tigt wird ein Master Transponder. Dies sichert gegen Manipulation

Beim ersten Einschalten geht das Ger�t in den Programmier Modus. 
Der erste Transponder, der vorgehalten wird, wird als Master gespeichert. 
( Platz 0 in der Liste)
Das Ger�t pr�ft beim Start ob Platz 0 belegt ist.

Zuf�gen von Transpondern:
1. Master vorhalten -> Ger�t geht in Programmier Modus:  LED Anzeige leuchtet.
  Zeigt Speicherplatz 1.  Ist der belegt, leuchtet der Dezimalpunkt von Stelle 1
  Freien Speicherplatz ( = User Nr) mit der Up Taste w�hlen.
2. OK dr�cken -> LED Anzeige springt auf "Ok"
3. Transponder hinhalten. Wenn eingelesen, verl��t das Ger�t den Prog. Modus, LEDs aus.

L�schen von Transpondern:
1. Wie oben, aber Auswahl eines belegten Speicherplatzes. Dezimalpunkt Stelle 1 an.
2. "OK" dr�cken. LED zeigt "DE" (delete), erneut "OK" dr�cken.
3. Transponder gel�scht, Ger�t verl��t den Prog. Modus, LEDs aus.


Wird Speicher Stelle 0 gel�scht, ist der Master Transponder gel�scht.
Beim n�chsten einschalten mu� ein neuer Master eingelernt werden.


�ber Kommentare / Verbesserungen w�rde ich mich freuen

Martin700