# -*- coding: UTF-8 -*-

# start from freecad python console with:
# execfile( 'freecad_test1.py' )
import Part, FreeCAD, math
from FreeCAD import Base

# Gehäusedefinition (in mm)
wandstaerke=2.1

# debug
App.closeDocument("Unnamed")
App.newDocument()
# debug

#
# untere Schale
#

unten1 = App.ActiveDocument.addObject("Part::Box","_unten1")
unten1.Length = 71.3
unten1.Width  = 90.8
unten1.Height = 26.6
pos = Base.Vector( -unten1.Length/2.0, -unten1.Width/2.0, -unten1.Height/2.0 ) # center at 0,0,0
unten1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

unten2 = App.ActiveDocument.addObject("Part::Box","_unten2")
unten2.Length = unten1.Length - wandstaerke*2.0
unten2.Width  = unten1.Width - wandstaerke*2.0
unten2.Height = 19.5
pos = pos + Base.Vector(wandstaerke,wandstaerke,unten1.Height-unten2.Height)
unten2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","_unten3")
cut.Base = unten1
cut.Tool = unten2
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

unten4 = App.ActiveDocument.addObject("Part::Box","_unten4")
unten4.Length = 25
unten4.Width  = 22.4
unten4.Height = 4.8
pos = unten1.Placement.Base
pos = pos + Base.Vector(wandstaerke,wandstaerke,0)
unten4.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","_unten5")
cut.Base = teil
cut.Tool = unten4
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

unten6 = App.ActiveDocument.addObject("Part::Box","_unten6")
unten6.Length = unten4.Length
unten6.Width  = unten4.Width
unten6.Height = unten4.Height
pos = unten1.Placement.Base
pos = pos + Base.Vector(unten1.Length-unten6.Length-wandstaerke,wandstaerke,0)
unten6.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","_unten7")
cut.Base = teil
cut.Tool = unten6
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

unten8 = App.ActiveDocument.addObject("Part::Box","_unten8")
unten8.Length = unten1.Length - 2.0*wandstaerke
unten8.Width  = 24.7
unten8.Height = unten4.Height
pos = unten1.Placement.Base
pos = pos + Base.Vector(wandstaerke,unten1.Width-unten8.Width-wandstaerke,0)
unten8.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","_unten9")
cut.Base = teil
cut.Tool = unten8
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

unten10 = App.ActiveDocument.addObject("Part::Box","_unten10")
unten10.Length = unten1.Length
unten10.Width  = 34.8
unten10.Height = unten4.Height
wandstaerke2   = 1.5
pos = unten1.Placement.Base
pos = pos + Base.Vector(0,unten1.Width-wandstaerke-unten8.Width-wandstaerke2-unten10.Width,0)
unten10.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","_unten11")
cut.Base = teil
cut.Tool = unten10
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

# kleine Ausbrüche
xoffset = 4.2
yoffset = 60.4
unten_ausbruch1 = App.ActiveDocument.addObject("Part::Box","_unten_ausbruch1")
unten_ausbruch1.Length = 14.0 - xoffset
unten_ausbruch1.Width  = 2.3
unten_ausbruch1.Height = 2.5
pos = unten1.Placement.Base
pos = pos + Base.Vector(xoffset,yoffset,unten1.Height-unten2.Height-unten_ausbruch1.Height)
unten_ausbruch1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","_unten12")
cut.Base = teil
cut.Tool = unten_ausbruch1
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

# kleine Ausbrüche
unten_ausbruch2 = App.ActiveDocument.addObject("Part::Box","_unten_ausbruch2")
unten_ausbruch2.Length = unten_ausbruch1.Length
unten_ausbruch2.Width  = unten_ausbruch1.Width
unten_ausbruch2.Height = unten_ausbruch1.Height
xoffset = unten1.Length - xoffset - unten_ausbruch2.Length
yoffset = 60.4
pos = unten1.Placement.Base
pos = pos + Base.Vector(xoffset,yoffset,unten1.Height-unten2.Height-unten_ausbruch2.Height)
unten_ausbruch2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
teil = cut
cut = App.activeDocument().addObject("Part::Cut","unten")
cut.Base = teil
cut.Tool = unten_ausbruch2
Gui.activeDocument().hide( cut.Base.Name )
Gui.activeDocument().hide( cut.Tool.Name )

#
# Bohrungen unten
#

durchmesser = 4.0
anzahl = 13
bohrloecher_verteilt_auf = 65.3
abstand = (bohrloecher_verteilt_auf - durchmesser*anzahl) / (anzahl-1.0)
xoffset = (unten1.Length - bohrloecher_verteilt_auf) / 2.0
zoffset = 10

teil = App.activeDocument().getObject('unten')
for n in range(anzahl):
  bohr1 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_unten"+str(n))
  bohr1.Radius = durchmesser/2.0
  bohr1.Height = wandstaerke*3.0
  pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
  pos = pos + Base.Vector(xoffset+durchmesser/2.0,2.0*wandstaerke,-zoffset)
  pos = pos + Base.Vector(n*(durchmesser+abstand),0,0)
  bohr1.Placement = App.Placement(pos,App.Rotation(1,0,0,1))
  
  # bohren
  cut = App.activeDocument().addObject("Part::Cut","unten_gebohrt"+str(n))
  cut.Base = teil
  cut.Tool = bohr1
  Gui.activeDocument().hide(teil.Name)
  Gui.activeDocument().hide(bohr1.Name)
  teil = cut

#
# Bohrungen oben
#

anzahl = 12
bohrloecher_verteilt_auf = 60.0
abstand = (bohrloecher_verteilt_auf - durchmesser*anzahl) / (anzahl-1.0)
xoffset = (unten1.Length - bohrloecher_verteilt_auf) / 2.0

for n in range(anzahl):
  bohr1 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_oben"+str(n))
  bohr1.Radius = durchmesser/2.0
  bohr1.Height = wandstaerke*3.0
  pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
  pos = pos + Base.Vector(xoffset+durchmesser/2.0,unten1.Width+wandstaerke,-zoffset)
  pos = pos + Base.Vector(n*(durchmesser+abstand),0,0)
  bohr1.Placement = App.Placement(pos,App.Rotation(1,0,0,1))
  
  # bohren
  cut = App.activeDocument().addObject("Part::Cut","oben_gebohrt"+str(n))
  cut.Base = teil
  cut.Tool = bohr1
  Gui.activeDocument().hide(teil.Name)
  Gui.activeDocument().hide(bohr1.Name)
  teil = cut

#
# Befestigungsbohrung unten, links
#
durchmesser_bohrung = 1.3
durchmesser_bolzen  = 4.1
abstand_x = 2.0
hoehe = 1.5
xoffset = abstand_x + durchmesser_bolzen / 2.0
yoffset = 33.0 - durchmesser_bolzen / 2.0

cyl1 = App.ActiveDocument.addObject("Part::Cylinder","_bolzen_unten_links")
cyl1.Radius = durchmesser_bolzen/2.0
cyl1.Height = hoehe
pos = unten2.Placement.Base
pos = pos + Base.Vector(xoffset,yoffset,0)
cyl1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl2 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_unten_links")
cyl2.Radius = durchmesser_bohrung/2.0
cyl2.Height = cyl1.Height
cyl2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# bohren
cut = App.activeDocument().addObject("Part::Cut","bolzen_unten_links")
cut.Base = cyl1
cut.Tool = cyl2
Gui.activeDocument().hide(cyl1.Name)
Gui.activeDocument().hide(cyl2.Name)

#
# Befestigungsbohrung unten, rechts
#
App.ActiveDocument.recompute() # compute boolean operations
s = cut.Shape.copy()
s.translate( Base.Vector(unten2.Length-2.0*xoffset,0,0) )
cut1 = App.activeDocument().addObject("Part::Feature","bolzen_unten_rechts")
cut1.Shape = s

#
# Befestigungsbohrung oben, rechts
#
s = cut1.Shape.copy()
s.translate( Base.Vector(0,14.4,0) )
cut1 = App.activeDocument().addObject("Part::Feature","bolzen_oben_rechts")
cut1.Shape = s

#
# Befestigungsbohrung oben, links
#
s = cut.Shape.copy()
s.translate( Base.Vector(0,14.4,0) )
cut = App.activeDocument().addObject("Part::Feature","bolzen_oben_links")
cut.Shape = s

#
# Auflagepunkte
#

anzahl = 6
auflagepunkte_verteilt_auf = 20.6
laenge = 1.7
abstand = (auflagepunkte_verteilt_auf - laenge*anzahl) / (anzahl-1.0)
xoffset = (unten2.Length - auflagepunkte_verteilt_auf) / 2.0

for n in range(anzahl):
  auflage1 = App.ActiveDocument.addObject("Part::Box","auflage_oben"+str(n))
  auflage1.Length = laenge
  auflage1.Width = 0.7
  auflage1.Height = hoehe
  pos = unten2.Placement.Base
  pos = pos + Base.Vector( xoffset, unten2.Width-auflage1.Width, 0 )
  pos = pos + Base.Vector(n*(laenge+abstand),0,0)
  auflage1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

for n in range(anzahl):
  auflage1 = App.ActiveDocument.addObject("Part::Box","auflage_unten"+str(n))
  auflage1.Length = laenge
  auflage1.Width = 0.7
  auflage1.Height = hoehe
  pos = unten2.Placement.Base
  pos = pos + Base.Vector( xoffset, 0, 0 )
  pos = pos + Base.Vector(n*(laenge+abstand),0,0)
  auflage1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))



App.ActiveDocument.recompute()
Gui.activeDocument().activeView().setCameraType("Perspective")
#Gui.activeDocument().activeView().viewBottom()
Gui.SendMsgToActiveView("ViewFit")
