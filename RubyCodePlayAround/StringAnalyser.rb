class StringAnalyser
  def initialize(string)
    @string = string
  end




  #------------------------------------------------------------------------------
  #zählt wie oft der teilstring in  @string vorkommt und gibt dies als Zahl aus.
  #------------------------------------------------------------------------------
 
  def zaehle(teilstring)
    counter=0
    l=teilstring.length
    for i in 0..@string.length
      if @string[i,l]==teilstring
        counter+=1
      end
      i+=1
    end
  puts counter
  end
  
  #------------------------------------------------------------------------------
  #extrahiert alles was hinter dem Trennzeichen kommt und gibt nur den Teil von  
  #@String aus der davor kommt. Gibt es kein Trennzeichen so wird nil zurückgeliefert
  #------------------------------------------------------------------------------
  #------------------------------------------------------------------------------

  def extrahiere_endung(trenn_zeichen)
    #sucht nach dem letzten Vorkommen von Trennzeichen in @string und gibt es als Zahl aus, falls nichts gefunden wird gibt es nil aus
    i= @string.rindex(trenn_zeichen)
    #sofern das Trennzeichen gefunden wurde...
    if i!=nil
    #...gibt die Methode alle Elemente des Strings hinter dem letzten Trennzeichen aus
    puts @string[(i+1)..-1]
    else
    puts "Trennzeichen nicht vorhanden"
    end
  end
  
  #------------------------------------------------------------------------------
  #extrahiert alles was vor dem letzten Trennzeichen kommt und gibt nur aus was
  #dahinter vorkommt. Kommt kein Trennzeichen vor, so wird der gesamte String
  #ausgegeben
  #------------------------------------------------------------------------------

  def extrahiere_praefix(trenn_zeichen)
    #sucht nach dem letzten Vorkommen von Trennzeichen in @string und gibt es als Zahl aus, falls nichts gefunden wird gibt es nil aus
    i= @string.rindex(trenn_zeichen)
    #sofern das Vorzeichen gefunden wurde...
    if i!=nil
    #...gibt die Methode den String bis uneinschließlich des letzten Vorkommen des Trennzeichens aus
    puts @string[0...i]
  else
    #sofern das Trennzeichen nicht gefunden wurde wird der String ausgegeben
    puts @string
  end  end
  
  #------------------------------------------------------------------------------
  #Ersetzt die Endung, also alles was hinter dem letzten Trennzeichen kommt
  #mit einer neuen Endung. Sollte das Trennzeichen nicht vorhanden sein, wird
  #ausgegeben das es nicht vorhanden ist
  #------------------------------------------------------------------------------
  
  def ersetze_endung(trenn_zeichen,neue_endung)
    #sucht nach dem letzten Vorkommen von Trennzeichen in @string und gibt es als Zahl aus, falls nichts gefunden wird gibt es nil aus
    i= @string.rindex(trenn_zeichen)
    #sofern das Vorzeichen gefunden wurde...
    if i!=nil
    #...gibt die Methode den String bis zum letzten Vorkommen des Trennzeichens plus der neuen Endung aus
    puts @string[0..i]+neue_endung
  else
    #sofern das Trennzeichen nicht gefunden wurde wird der String plus der neuen Endung ausgegeben
    puts @string + neue_endung
  end
  end
  
  #------------------------------------------------------------------------------
  #Zählt die Anzahl an Wörtern die in @string vorkommen, wobei hier alles gezählt
  #wird was zwischen den Trennzeichen liegt. Die Elemente zwischen den Trennzeichen
  #werden dann in ein array kopiert
  #------------------------------------------------------------------------------

  def anzahl_woerter(trenn_zeichen)
    ary = Array.new()
    x = 0
    for i in 0... @string.length	#packt alle wörter in ein array
      if (@string[i+1] == trenn_zeichen || i == @string.length - 1) && @string[i] != trenn_zeichen	#überprüft ob das nächste zeichen ein trennzeichen ist oder ab das aktuelle keins ist wenn ja wird der jeweilige abschnitt in ein array übergeben
        ary.insert(-1, @string[x..i])
        x = i + 1
        while @string[x] == trenn_zeichen
          x+=1
        end
      end
    end
    puts ary.size
    return ary
  end

  def to_s()
    return @string
  end

end

#testfälle

str_ana = StringAnalyser.new("ana haelt nichts von ananas")
str_ana2 = StringAnalyser.new("....hallo....ollah...rb")
str_ana3 = StringAnalyser.new("......")
#------------------------------------------------
str_ana.zaehle("ana") #=> 3
str_ana2.zaehle("..") #=> 8
str_ana3.zaehle("...") #=> 4
#------------------------------------------------
str_ana.extrahiere_endung(" ") #=> ananas
str_ana2.extrahiere_endung(".") #=> rb
str_ana3.extrahiere_endung(".") #=>
#------------------------------------------------
str_ana.extrahiere_praefix(" ") #=> ana haelt nichts von
str_ana2.extrahiere_praefix(".") #=> ....hallo....ollah..
str_ana3.extrahiere_praefix(".") #=> .....
#------------------------------------------------
str_ana.anzahl_woerter(" ") #=> 5
str_ana.anzahl_woerter(".") #=> 1
str_ana2.anzahl_woerter(".") #=> 3
str_ana3.anzahl_woerter(".") #=> 0
#------------------------------------------------
str_ana2.ersetze_endung(".","txt") #=> ....hallo....ollah...txt
str_ana3.ersetze_endung(" ","txt") #=> ......txtz
#------------------------------------------------
puts str_ana                #=> "ana haelt nichts von ananas"
puts str_ana2               #=> "....hallo....ollah...rb"
puts str_ana3               #=> "......"