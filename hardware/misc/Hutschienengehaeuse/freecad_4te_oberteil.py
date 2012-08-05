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

oben1 = App.ActiveDocument.addObject("Part::Box","_oben1")
oben1.Length = 71.3
oben1.Width  = 44.8
oben1.Height = 21.5
pos = Base.Vector( -oben1.Length/2.0, -oben1.Width/2.0, -oben1.Height/2.0 ) # center at 0,0,0
oben1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

pos = pos + Base.Vector(wandstaerke,wandstaerke,0)
oben2 = App.ActiveDocument.addObject("Part::Box","_oben2")
oben2.Length = oben1.Length - wandstaerke*2.0
oben2.Width  = oben1.Width - wandstaerke*2.0
oben2.Height = oben1.Height - wandstaerke
oben2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

pos = oben1.Placement.Base + Base.Vector(wandstaerke,wandstaerke,oben1.Height - 0.5)
oben_schriftfeld = App.ActiveDocument.addObject("Part::Box","_oben4")
oben_schriftfeld.Length = oben1.Length - wandstaerke*2.0
oben_schriftfeld.Width  = oben1.Width - wandstaerke*2.0
oben_schriftfeld.Height = 1
oben_schriftfeld.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","_oben3")
cut.Base = App.activeDocument()._oben1
cut.Tool = App.activeDocument()._oben2
Gui.activeDocument().hide('_oben1')
Gui.activeDocument().hide('_oben2')

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","oben")
cut.Base = App.activeDocument()._oben3
cut.Tool = App.activeDocument()._oben4
Gui.activeDocument().hide('_oben3')
Gui.activeDocument().hide('_oben4')

#
#
#

mitte1 = App.ActiveDocument.addObject("Part::Box","_mitte1")
mitte1.Length = oben1.Length
mitte1.Width  = 62.0
mitte1.Height = 16.8
pos = Base.Vector( -mitte1.Length/2.0, -mitte1.Width/2.0, -mitte1.Height/2.0 ) # center at 0,0,0
pos = pos - Base.Vector(0,0,oben1.Height/2.0+mitte1.Height/2.0)
mitte1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

mitte2 = App.ActiveDocument.addObject("Part::Box","_mitte2")
mitte2.Length = mitte1.Length - wandstaerke*2.0
mitte2.Width  = mitte1.Width - wandstaerke*2.0
mitte2.Height = mitte1.Height
pos = mitte1.Placement.Base + Base.Vector(wandstaerke,wandstaerke,-wandstaerke)
mitte2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

mitte3 = App.ActiveDocument.addObject("Part::Box","_mitte3")
mitte3.Length = oben1.Length - wandstaerke*2.0
mitte3.Width  = oben1.Width - wandstaerke*2.0
mitte3.Height = wandstaerke*3.0
pos = oben1.Placement.Base + Base.Vector(wandstaerke,wandstaerke,-wandstaerke*2)
mitte3.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","_mitte4")
cut.Base = App.activeDocument()._mitte1
cut.Tool = App.activeDocument()._mitte2
Gui.activeDocument().hide('_mitte1')
Gui.activeDocument().hide('_mitte2')

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","mitte")
cut.Base = App.activeDocument()._mitte4
cut.Tool = App.activeDocument()._mitte3
Gui.activeDocument().hide('_mitte4')
Gui.activeDocument().hide('_mitte3')



#
#
#

unten1 = App.ActiveDocument.addObject("Part::Box","_unten1")
unten1.Length = oben1.Length
unten1.Width  = 90.8
unten1.Height = 5.5
pos = Base.Vector( -unten1.Length/2.0, -unten1.Width/2.0, -unten1.Height/2.0 ) # center at 0,0,0
pos = pos - Base.Vector(0,0,oben1.Height/2.0+mitte1.Height+unten1.Height/2.0)
unten1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

unten2 = App.ActiveDocument.addObject("Part::Box","_unten2")
unten2.Length = unten1.Length - wandstaerke*2.0
unten2.Width  = unten1.Width - wandstaerke*2.0
unten2.Height = unten1.Height
pos = unten1.Placement.Base + Base.Vector(wandstaerke,wandstaerke,-wandstaerke)
unten2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

unten3 = App.ActiveDocument.addObject("Part::Box","_unten3")
unten3.Length = oben1.Length - wandstaerke*2.0
unten3.Width  = mitte1.Width - wandstaerke*2.0
unten3.Height = wandstaerke*3.0
pos = mitte1.Placement.Base + Base.Vector(wandstaerke,wandstaerke,-wandstaerke*2)
unten3.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","_unten4")
cut.Base = App.activeDocument()._unten1
cut.Tool = App.activeDocument()._unten2
Gui.activeDocument().hide('_unten1')
Gui.activeDocument().hide('_unten2')

# erzeugen
cut = App.activeDocument().addObject("Part::Cut","unten")
cut.Base = App.activeDocument()._unten4
cut.Tool = App.activeDocument()._unten3
Gui.activeDocument().hide('_unten4')
Gui.activeDocument().hide('_unten3')

#
# Bohrungen unten
#

durchmesser = 4.0
anzahl = 13
bohrloecher_verteilt_auf = 65.3
abstand = (bohrloecher_verteilt_auf - durchmesser*anzahl) / (anzahl-1.0)
xoffset = (oben1.Length - bohrloecher_verteilt_auf) / 2.0
yoffset = (unten1.Width - mitte1.Width) / 2.0 / 2.0

teil = App.activeDocument().getObject('unten')
for n in range(anzahl):
  bohr1 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_unten"+str(n))
  bohr1.Radius = durchmesser/2.0
  bohr1.Height = wandstaerke*3.0
  pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
  pos = pos + Base.Vector(xoffset+durchmesser/2.0,yoffset,-wandstaerke*2.0)
  pos = pos + Base.Vector(n*(durchmesser+abstand),0,0)
  bohr1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))
  
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

durchmesser = 4.0
anzahl = 12
bohrloecher_verteilt_auf = 60.0
abstand = (bohrloecher_verteilt_auf - durchmesser*anzahl) / (anzahl-1.0)
xoffset = (oben1.Length - bohrloecher_verteilt_auf) / 2.0
yoffset = unten1.Width - (unten1.Width - mitte1.Width) / 2.0 / 2.0

for n in range(anzahl):
  bohr1 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_oben"+str(n))
  bohr1.Radius = durchmesser/2.0
  bohr1.Height = wandstaerke*3.0
  pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
  pos = pos + Base.Vector(xoffset+durchmesser/2.0,yoffset,-wandstaerke*2.0)
  pos = pos + Base.Vector(n*(durchmesser+abstand),0,0)
  bohr1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))
  
  # bohren
  cut = App.activeDocument().addObject("Part::Cut","oben_gebohrt"+str(n))
  cut.Base = teil
  cut.Tool = bohr1
  Gui.activeDocument().hide(teil.Name)
  Gui.activeDocument().hide(bohr1.Name)
  teil = cut

#
# Befestigungsbohrung links
#

durchmesser1 = 2.0
durchmesser2 = 6.5
durchmesser3 = 4.5
hoehe = 2.2
durchmesser4 = 4.5
hoehe4 = 2.0
xoffset = durchmesser2 / 2.0
yoffset = unten1.Width - durchmesser2 / 2.0

cyl1 = App.ActiveDocument.addObject("Part::Cylinder","_cyl_links")
cyl1.Radius = durchmesser2/2.0
cyl1.Height = hoehe
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-wandstaerke-cyl1.Height)
cyl1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl2 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_links")
cyl2.Radius = durchmesser1/2.0
cyl2.Height = (hoehe+wandstaerke)*3.0
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-cyl2.Height/2.0)
cyl2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl3 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung2_links")
cyl3.Radius = durchmesser4/2.0
cyl3.Height = hoehe4
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-cyl3.Height)
cyl3.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# bohren
cut = App.activeDocument().addObject("Part::Cut","links_gebohrt3")
cut.Base = teil
cut.Tool = cyl2
Gui.activeDocument().hide(teil.Name)
Gui.activeDocument().hide(cyl2.Name)
teil = cut
cut = App.activeDocument().addObject("Part::Cut","links_gebohrt1")
cut.Base = teil
cut.Tool = cyl3
Gui.activeDocument().hide(teil.Name)
Gui.activeDocument().hide(cyl2.Name)
cut = App.activeDocument().addObject("Part::Cut","links_gebohrt2")
cut.Base = cyl1
cut.Tool = cyl2
Gui.activeDocument().hide(cyl1.Name)
Gui.activeDocument().hide(cyl2.Name)

#
# Befestigungsbohrung rechts
#

durchmesser1 = 2.0
durchmesser2 = 6.5
durchmesser3 = 4.5
hoehe = 2.2
durchmesser4 = 4.5
hoehe4 = 2.0
xoffset = unten1.Length - durchmesser2 / 2.0
yoffset = unten1.Width - durchmesser2 / 2.0

cyl1 = App.ActiveDocument.addObject("Part::Cylinder","_cyl_rechts")
cyl1.Radius = durchmesser2/2.0
cyl1.Height = hoehe
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-wandstaerke-cyl1.Height)
cyl1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl2 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_rechts")
cyl2.Radius = durchmesser1/2.0
cyl2.Height = (hoehe+wandstaerke)*3.0
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-cyl2.Height/2.0)
cyl2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl3 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung2_rechts")
cyl3.Radius = durchmesser4/2.0
cyl3.Height = hoehe4
pos = unten1.Placement.Base + Base.Vector(0,0,unten1.Height)
pos = pos + Base.Vector(xoffset,yoffset,-cyl3.Height)
cyl3.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# bohren
cut = App.activeDocument().addObject("Part::Cut","rechts_gebohrt3")
cut.Base = App.ActiveDocument.getObject( "links_gebohrt1" )
cut.Tool = cyl2
Gui.activeDocument().hide(teil.Name)
Gui.activeDocument().hide(cyl2.Name)
teil = cut
cut = App.activeDocument().addObject("Part::Cut","rechts_gebohrt1")
cut.Base = teil
cut.Tool = cyl3
Gui.activeDocument().hide(teil.Name)
Gui.activeDocument().hide(cyl2.Name)
cut = App.activeDocument().addObject("Part::Cut","rechts_gebohrt2")
cut.Base = cyl1
cut.Tool = cyl2
Gui.activeDocument().hide(cyl1.Name)
Gui.activeDocument().hide(cyl2.Name)


#
# Befestigungsbohrung innen, oben, links
#
durchmesser_bohrung = 1.3
durchmesser_bolzen  = 4.0
abstand_x = 2.0 + wandstaerke
abstand_y = 3.5 + wandstaerke # nochmal messen!
hoehe = 2.5
xoffset = abstand_x + durchmesser_bolzen / 2.0
yoffset = abstand_y + durchmesser_bolzen / 2.0

cyl1 = App.ActiveDocument.addObject("Part::Cylinder","_bolzen_innen_oben_links")
cyl1.Radius = durchmesser_bolzen/2.0
cyl1.Height = hoehe
pos = mitte1.Placement.Base + Base.Vector(0,0,mitte1.Height)
pos = pos + Base.Vector(xoffset,mitte1.Width-yoffset,-wandstaerke-cyl1.Height)
cyl1.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

cyl2 = App.ActiveDocument.addObject("Part::Cylinder","_bohrung_innen_oben_links")
cyl2.Radius = durchmesser_bohrung/2.0
cyl2.Height = cyl1.Height
cyl2.Placement = App.Placement(pos,App.Rotation(0,0,0,1))

# bohren
cut = App.activeDocument().addObject("Part::Cut","innen_oben_links_gebohrt")
cut.Base = cyl1
cut.Tool = cyl2
Gui.activeDocument().hide(cyl1.Name)
Gui.activeDocument().hide(cyl2.Name)

#
# Befestigungsbohrung innen, oben, rechts
#
App.ActiveDocument.recompute() # compute boolean operations
s=cut.Shape.copy()
s.translate( Base.Vector(mitte1.Length-2.0*xoffset,0,0) )
cut = App.activeDocument().addObject("Part::Feature","innen_oben_rechts_gebohrt")
cut.Shape = s

#
# Befestigungsbohrung innen, unten, rechts
#
s=cut.Shape.copy()
s.translate( Base.Vector(0,-(mitte1.Width-2.0*yoffset),0) )
cut = App.activeDocument().addObject("Part::Feature","innen_unten_rechts_gebohrt")
cut.Shape = s

#
# Befestigungsbohrung innen, unten, links
#
s=cut.Shape.copy()
s.translate( Base.Vector(-(mitte1.Length-2.0*xoffset),0,0) )
cut = App.activeDocument().addObject("Part::Feature","innen_unten_links_gebohrt")
cut.Shape = s








App.ActiveDocument.recompute()
Gui.activeDocument().activeView().setCameraType("Perspective")
Gui.activeDocument().activeView().viewBottom()
Gui.SendMsgToActiveView("ViewFit")
