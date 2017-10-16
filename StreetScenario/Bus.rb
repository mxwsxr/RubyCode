require 'Rechteck'
require "Kreis"

class Bus
   def initialize
     @fahrgestell = Rechteck.new(120,65,80,25,"blue",true)
     @kabine = Rechteck.new(120,41,60,40,"blue",true)
     @fenster_1 = Rechteck.new(126,46,13,18,"white",true)
     @fenster_2 = Rechteck.new(144,46,13,18,"white",true)
     @fenster_3 = Rechteck.new(162,46,13,18,"white",true)
     @rad_1 = Kreis.new(140,90,10,"red",true)
     @rad_2 = Kreis.new(180,90,10,"red",true)
   end
  
   def sichtbar_machen()
      @fahrgestell.sichtbar_machen()
      @kabine.sichtbar_machen()
      @fenster_1.sichtbar_machen()
      @fenster_2.sichtbar_machen()
      @fenster_3.sichtbar_machen()
      @rad_1.sichtbar_machen()
      @rad_2.sichtbar_machen()
   end
   
   #lesende methoden
   
   def breite
      return @fahrgestell.breite
   end
   
   def hoehe 
     return @fahrgestell.hoehe + @kabine.hoehe + @rad.radius()
   end
 
   def position
     return @fahrgestell.obere_linke_ecke() + Point.new(0, @fahrgestell.hoehe+@rad_1.radius)
   end
   
   def bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @fahrgestell.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @kabine.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @fenster_1.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @fenster_2.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @fenster_3.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @rad_1.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
      @rad_2.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    end
   
   def auf_position_setzen(ziel_pos_x,ziel_pos_y)
     self.bewegen(ziel_pos_x - position.x,ziel_pos_y - position.y,1,1,1)
   end
   
   def nach_vorne_fahren(wdh,wdh_nach,starten_nach)                      
     self.bewegen(1,0,wdh,wdh_nach,starten_nach)
   end
   
   def nach_unten_fahren(wdh,wdh_nach,starten_nach)                    
     self.bewegen(0,1,wdh,wdh_nach,starten_nach)
   end
   
   def nach_oben_fahren(wdh,wdh_nach,starten_nach)
     self.bewegen(0,-1,wdh,wdh_nach,starten_nach)
   end
   
  def einparken(x_links,x_rechts,y)    
    #self.bewegen((x_links+(((x_rechts-x_links)-self.breite)/2))-position.x,0,1,1,180)
    #self.bewegen(0,((y-position.y)-@rad_1.radius),1,1,540)
    wdh_nach_vorne = x_links+(((x_rechts-x_links)-self.breite)/2)-position.x
    self.nach_vorne_fahren(wdh_nach_vorne,10,0)
    self.nach_oben_fahren((y - position().y).abs(),10,10 * wdh_nach_vorne) #
  end
  
  def ausparken(fahrlinie)
    self.nach_unten_fahren(fahrlinie - position.y,10,0)
    #self.bewegen(0, fahrlinie - position.y, wdh_nach,starten_nach)
  end
  

   #def einparken(x_links, x_rechts, y)
     #self.nach_vorne_fahren until (self.position.x + self.breite/2) == (x_links + (x_links - x_rechts)/2) 
     #self.nach_oben_fahren until self.position.y == y
  #end
   
   #def ausparken(fahrlinie)
     #self.nach_unten_fahren(1,1,1) until self.position.y == @mittelstreifen.y    #kann ich hier @mittelstreifen verwenden oder muss ich es als globale Variable definieren?
   #end                                                                           #kann ich self mit position.y ansprechen?
                                                                                  #wie bekomme ich den y_wert des Mittelstreifens?
   
   def abdunkeln()
     @fahrgestell.farbe_aendern("hellgrau")
     @fahrgestell.farbe_aendern("hellgrau")
     @kabine.farbe_aendern("hellgrau")
     @fenster_1.farbe_aendern("grau")
     @fenster_2.farbe_aendern("grau")
     @fenster_3.farbe_aendern("grau")
     @rad_1.farbe_aendern("hellgrau")
     @rad_2.farbe_aendern("hellgrau")
   end
   
   def in_farbe_aendern()
     @fahrgestell.farbe_aendern("blau")                                        #ist es auch moeglich das Ganze durch die Methode initialize zu uebernehmen?
     @kabine.farbe_aendern("blau")
     @fenster_1.farbe_aendern("weiss")
     @fenster_2.farbe_aendern("weiss")
     @fenster_3.farbe_aendern("weiss")
     @rad_1.farbe_aendern("rot")
     @rad_2.farbe_aendern("rot") 
   end
   
end