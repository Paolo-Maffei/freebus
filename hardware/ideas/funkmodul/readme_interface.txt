Dies ist der Entwurf f�r ein freebus AVR controllerboard mit RF (funk).
-----------------------------------------------------------------------

TP-RF interface

    * Das Draht-zu-Funk Interface soll eine Erweiterung des AVR 4TE controllerboards werden.
      
    * Einen "RF only" Controller kann man durch weglassen der EIB Scnittstelle daraus machen.
      dann hat man auch genug pins f�r 8 I/O lines und zus�tzlich I2C

2 Best�ckungsvarianten:
    1. mit RF: RFM22 + R1 best�cken, Quarz und 2 x 33p weglassen
               (RFM22 erzeugt den Takt f�r den AVR).
    2. ohne RF ( also ganz normales Controllerboard ):
               RFM22 + R1 weglassen, Quarz und 2 x 33p best�cken.

Alle zeitkritischen Dinge im RF werden vom RFM22 selbstst�ndig abgewickelt. Daher kann ein AVR beide, RF und TP, parallel bedienen.
Vorschlag f�r die Benutzung der ATMEGA168P (A) (evtl ATMEGA328P) pins�

PIN               FUNKTION
---               --------
PB0/ICP1/CLKO     ICP1   EIB_IN  (input capture)
PB1/OC1A          OC1A   CTRL    (PWM direkt mit timer1 machbar?)
PB2/OC1B/SS       SS     RFM22.NSEL
PB3/OC2A/MOSI     MOSI   RFM22.SDI
PB4/MISO          MISO   RFM22.SDO
PB5/SCK           SCK    RFM22.SCK
PB6/XTAL1         XTAL1  clock in von RFM22, Quarz wenn ohne RFM22
PB7/XTAL2         XTAL2  RFM22.SDN bzw. Quarz wenn ohne RFM22

PC0/ADC0                 IO1
PC1/ADC1                 IO2
PC2/ADC2                 IO3
PC3/ADC3                 IO4
PC4/ADC4/SDA             IO5/SDA   entweder 8 I/O lines oder 6 I/O + I2C
PC5/ADC5/SCL             IO6/SCL

PD0/RXD           RXD    RXD/RES3
PD1/TXD           TXD    TXD/RES4
PD2/INT0          INT0   evtl. EIB_IN
PD3/INT1          INT1   RFM22.NIRQ
PD4/XCK/T0        PD4    PROG
PD5/T1/OC0B       OC0B   EIB_OUT
PD6/AIN0/OC0A     PD6    IO7
PD7/AIN1          PD7    IO8

Einschr�nkung gegen�ber 4TE AVR controller

    * SDA/SCL nicht mehr gesondert verf�gbar
    * RES1/RES2 (reserve I/O) gibts nicht mehr.

Benutzung der AVR Hardware-Resourcen

    * Timer0
      timing f�r freebus (Draht)
      Output Compare register und pins f�r EIB_OUT

    * Timer1
      PWM f�r die App, Output Compare register und pin verwenden!
      Evtl zus�tzlich Input Capture von EIB_IN.
      (flanke an EIB_IN speichert wert des timer1. Daraus kann man den genauen Zeitpunkt der Flanke rekonstruieren, trotz interrupt latency)

    * Timer2
      timing f�r RF.

    * INT0
      EIB_IN. Wenn interrupt latency st�rt, zus�tzlich Input Capture mit Timer1.

    * INT1
      Interrupts vom RFM22

    * PCI Schnittstelle (MOSI, MISO, SCK, SS)
      bedient den RFM22



Antennenanschluss
-----------------
�ber SMB Buchse. Die Buchse ist vollst�ndig im 4TE Geh�use,
zug�nlich �ber ein Loch in der mittleren "Stufe" des Geh�uses.
Der SMB Stecker verdeckt evtl. 1 oder 2 Schraubklemmen-L�cher,
beim Anschliessen der Schraubklemmen muss er gezogen werden.

 U = SMB Buchse
 ! = SMB Stecker
 o = Schraublemmenloch wie �blich

__
  |
  o
  | !
  -- -
    U |
      |
      ---------
               |
               |
               |
               |


Fuses
------
 f�r ATMEGA168(P)
efuse = 01
hfuse = DF
lfuse = E0

