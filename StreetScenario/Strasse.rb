require "Rechteck"
require "Leinwand"

class Strasse
   
  def initialize(x,y,laenge,breite)
#    @x = x
#    @y = y
#    @laenge = laenge
#    @breite = breite                                                                      #wieso muss sichtbar_machen() aufgerufen werden? true sollte reichen?
    @fahrbahn = Rechteck.new(x, y, laenge, breite, :grey, true)                           #farbe wird in englisch notiert in den parametern und bei farbe übergeben in deutsch
    @mittelstreifen = Rechteck.new(x,(y+((breite-5)/2)), laenge, 5, :white, true)        #wie bekomme ich den y-Wert?
  end

  def sichtbar_machen()
    @fahrbahn.sichtbar_machen()
    @mittelstreifen.sichtbar_machen()
  end
  
  #lesende Methoden 
  
#    def x()
#      return @x
#    end
    
    def oben()                                 
      return @fahrbahn.obere_linke_ecke().y()                                   
    end
    
    def laenge()                                                                              #braucht man das hier ueberhaupt? 
      return @fahrbahn.breite
    end
    
    def breite() 
      return @fahrbahn.hoehe
    end
    
#    def fahrbahn()
#      return @fahrbahn
#    end
#    
#    def mittelstreifen()
#      return @mittelstreifen
#    end
  
  #veraendernde Methoden
  
  def abdunkeln()                                 
    @fahrbahn.farbe_aendern("schwarz")
    @mittelstreifen.farbe_aendern("hellgrau")
  end

  def in_farbe_aendern() 
    @fahrbahn.farbe_aendern("grau")
    @mittelstreifen.farbe_aendern("weiss")
  end

  def to_s()
    "Strasse #{@nummer}"
  end
end