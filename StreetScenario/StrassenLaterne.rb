require "Kreis"
require "Dreieck"
require "Rechteck"

class StrassenLaterne
  def initialize()
    @tag = true
    @schirm = Kreis.new(120,60,40,"yellow",true)
    @stiel = Rechteck.new(116,90,10,80,"green",true)
    @fuss = Rechteck.new(84,165,70,15,"blue",true)
    @leuchtstrahl1 = Rechteck.new(90,97,3,25,"yellow",true)
    @leuchtstrahl2 = Rechteck.new(100,97,3,25,"yellow",true)
    @leuchtstrahl3 = Rechteck.new(135,97,3,25,"yellow",true)
    @leuchtstrahl4 = Rechteck.new(145,97,3,25,"yellow",true)
  end

  def sichtbar_machen()
    @fuss.sichtbar_machen()
    @stiel.sichtbar_machen()
    @schirm.sichtbar_machen()
    if not @tag
      @leuchtstrahl1.sichtbar_machen()
      @leuchtstrahl2.sichtbar_machen()
      @leuchtstrahl3.sichtbar_machen()
      @leuchtstrahl4.sichtbar_machen()
    end
  end

  #lesende Methoden

  def breite
    return @fuss.breite
  end

  def position() #untere linke ecke des fusses
    return @fuss.obere_linke_ecke() + Point.new(0,@fuss.hoehe)
  end

  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    self.bewegen(ziel_pos_x - position().x,ziel_pos_y - position().y,1,1,1)
  end

  def bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @schirm.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @stiel.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @fuss.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @leuchtstrahl1.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @leuchtstrahl2.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @leuchtstrahl3.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
    @leuchtstrahl4.bewegen(x_delta,y_delta,wdh,wdh_nach,starten_nach)
  end

  def einschalten
    @tag = false
    @schirm.farbe_aendern("gelb")
    @leuchtstrahl1.farbe_aendern("gelb")
    @leuchtstrahl1.sichtbar_machen()
    @leuchtstrahl2.farbe_aendern("gelb")
    @leuchtstrahl2.sichtbar_machen()
    @leuchtstrahl3.farbe_aendern("gelb")
    @leuchtstrahl3.sichtbar_machen()
    @leuchtstrahl4.farbe_aendern("gelb")
    @leuchtstrahl4.sichtbar_machen()
  end

  def ausschalten
    @tag = true
    @schirm.farbe_aendern("orange")
    @leuchtstrahl1.unsichtbar_machen
    @leuchtstrahl2.unsichtbar_machen
    @leuchtstrahl3.unsichtbar_machen
    @leuchtstrahl4.unsichtbar_machen
  end

  def to_s                                                                    #wofuer brauche ich @nummer?
    "strassen_laterne #{@nummer}"
  end
end