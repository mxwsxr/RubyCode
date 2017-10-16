require "Strasse"
require "Leinwand"
require "StrassenLaterne"
require "Bus"

class StrassenSzene 
                    
  
  def initialize ()
    @strasse = Strasse.new(50,400,800,200)
    @strassen_laterne_1 = StrassenLaterne.new()
    @strassen_laterne_1.auf_position_setzen(70,@strasse.oben())
    @strassen_laterne_2 = StrassenLaterne.new()
    @strassen_laterne_2.auf_position_setzen(300,@strasse.oben())
    @strassen_laterne_3 = StrassenLaterne.new()
    @strassen_laterne_3.auf_position_setzen(530,@strasse.oben())
    @strassen_laterne_4 = StrassenLaterne.new()
    @strassen_laterne_4.auf_position_setzen(760,@strasse.oben())
    fahrlinie = @strasse.oben() + @strasse.breite()/2 - 30  
    @bus_1 = Bus.new()
    @bus_1.auf_position_setzen(100,fahrlinie)
    @bus_2 = Bus.new()
    @bus_2.auf_position_setzen(350,fahrlinie)
    @bus_3 = Bus.new()
    @bus_3.auf_position_setzen(500,fahrlinie)
  end
 
  def sichtbar_machen()
    @strasse.sichtbar_machen()
    @strassen_laterne_1.sichtbar_machen()
    @strassen_laterne_1.ausschalten()
    @strassen_laterne_2.sichtbar_machen()
    @strassen_laterne_2.ausschalten()
    @strassen_laterne_3.sichtbar_machen()
    @strassen_laterne_3.ausschalten()
    @strassen_laterne_4.sichtbar_machen()
    @strassen_laterne_4.ausschalten()
    @bus_1.sichtbar_machen()
    @bus_2.sichtbar_machen()    
    @bus_3.sichtbar_machen()
    
  end
  
  def in_tag_szene_aendern()
    @strasse.in_farbe_aendern()
    @strassen_laterne_1.ausschalten()
    @strassen_laterne_2.ausschalten()
    @strassen_laterne_3.ausschalten()
    @strassen_laterne_4.ausschalten()
    @bus_1.in_farbe_aendern()
    @bus_2.in_farbe_aendern()
    @bus_3.in_farbe_aendern()
  end
  
  def in_nacht_szene_aendern()
    @strasse.abdunkeln()
    @strassen_laterne_1.einschalten()
    @strassen_laterne_2.einschalten()
    @strassen_laterne_3.einschalten()
    @strassen_laterne_4.einschalten()
    @bus_1.abdunkeln()
    @bus_2.abdunkeln()
    @bus_3.abdunkeln()
  end
  
  def einparken()
    @bus_1.einparken((@strassen_laterne_1.position.x + @strassen_laterne_1.breite),@strassen_laterne_2.position.x,@strasse.oben())
    @bus_2.einparken((@strassen_laterne_2.position.x + @strassen_laterne_2.breite),@strassen_laterne_3.position.x,@strasse.oben())
    @bus_3.einparken((@strassen_laterne_3.position.x + @strassen_laterne_3.breite),@strassen_laterne_4.position.x,@strasse.oben())
  end
  
  def ausparken
    fahrlinie_ausparken = @strasse.oben() + @strasse.breite()/2 -30
    @bus_1.ausparken(fahrlinie_ausparken)
    @bus_2.ausparken(fahrlinie_ausparken)
    @bus_3.ausparken(fahrlinie_ausparken)
  end

  def clear()
    Leinwand.gib_einzige_instanz().alles_loeschen()
  end
end