class Taschenrechner
  def initialize()
    @z0=nil
    @z1=nil
  end

  def starten()
    puts "Dies ist ein einfacher Taschenrechner. Willkommen!"
    puts "Akzeptiert werden die Operatoren +,-,*,/ und **"
    puts "Das Programm lässt sich durch die Eingabe von exit beenden"
    puts "Viel Spaß!"
    
    eingabe=nil
    #Sobald man exit eingibt (wie auch immer in groß klein mit Leerzeichen s.u.) beendet sich das Programm
    while eingabe!="exit"
      
      #Die Eingabe wird auf lowercase Buchstaben geändert und ihrer beginnenden und endenden Leerzeichen entledigt
      #dadurch kann man Exit jetzt wirklich in jeder Form eingeben die man sich denken kann
      eingabe=gets.chomp.downcase.strip
      
      #Eine Case Abfrage für Eingabe, für jeden Operator gibt es einen Case der dann sagt das die Methode gestartet
      #werden soll, außer die Zahlen sind für den jeweiligen Operator noch nicht ausreichend belegt
      case eingabe
      when "+"
        if @z1!=nil
          addiere()
        else
          #Es sind nicht genügend Zahlen eingegeben, also wird der Nutzer durch die Methode op_nicht_moeglich darauf hingewiesen
          op_nicht_moeglich(eingabe)
        end
      when "-"
        #Sofern auch @z1 belegt ist wird normal subtrahiert, ist aber nur eine Zahl eingegeben wird stattdessen negiert
        if @z1!=nil
          subtrahiere()
        else
          negiere()
        end
      when "*"
        if @z1!=nil
          multipliziere()
        else
          op_nicht_moeglich(eingabe)
        end
      when "**"
        if @z1!=nil
          potenziere()
        else
          op_nicht_moeglich(eingabe)
        end
      when "/"
        if @z1!=nil
          dividiere()
        else
          op_nicht_moeglich(eingabe)
        end
      else
        #sofern es eine Zahl war (float oder int) und damit kein nil zurückkam wird die eingabe an speichern(zahl) übergeben
        if lese_zahl(eingabe)!=nil
          speichern(lese_zahl(eingabe))
        end

      end
      puts "zahl 0=#{@z0}"
      puts "zahl 1=#{@z1}"
    end
    puts "Sie haben einen einfachen Taschenrechner sehr glücklich gemacht"
  end

  def op_nicht_moeglich(op)
    puts "Die Ausführung einer Rechnung mit dem Operator #{op} ist im Moment nicht möglich, vielleicht fehlt noch eine Zahl?"
  end

  def speichern(zahl)
    if @z0==nil
      @z0=zahl
    elsif @z0!=nil && @z1==nil
      @z1=zahl
    elsif @z0!=nil && @z1!=nil
      puts "Keine Eingabe von Zahlen mehr möglich, es wird ein Operator erwartet"
    end
  end
  
  def lese_zahl(eingabe)
    if eingabe.to_f.to_s==eingabe  #checkt durch umwandeln in float und dann in string und dann Vergleich ob es ein float ist
      return eingabe.to_f
    elsif eingabe.to_i.to_s==eingabe  #checkt durch umwandeln in int und dann in string und dann Vergleich ob es ein integer ist
      return eingabe.to_i
    elsif eingabe!="exit"
      puts "keine gültige Eingabe, bitte erneut eingeben. Die Eingabe muss eine Zahl oder ein Operator sein"
      return nil
    end
  end

  def addiere
      @z0=@z0+@z1
      @z1=nil
      puts "Das Ergebnis ist #{@z0}"
  end

  def subtrahiere
      @z0=@z0-@z1
      @z1=nil
      puts "Das Ergebnis ist #{@z0}"
  end

  def negiere
      @z0=@z0*(-1)
      puts "Das Ergebnis ist #{@z0}"
  end

  def dividiere
      @z0=@z0/@z1
      @z1=nil
      puts "Das Ergebnis ist #{@z0}"
  end

  def multipliziere
      @z0=@z0*@z1
      @z1=nil
      puts "Das Ergebnis ist #{@z0}"
  end

  def potenziere
      @z0=@z0**@z1
      @z1=nil
      puts "Das Ergebnis ist #{@z0}"
  end

end

tr = Taschenrechner.new()

tr.starten()