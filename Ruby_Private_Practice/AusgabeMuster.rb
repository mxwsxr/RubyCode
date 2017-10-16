# A Ruby-Code to output geometrical pictures
# Author:: Albert Schuman
#______________________________________________________________________________________________________________________________________________
def dreieck1(n, chars)
  if(n%2==0)
    printf("Achtung! %d muss eine ungerade und positive Ziffer sein! \n", n)
  else
    1.upto(n) do |i|
      puts(chars * i)
    end
  end
end

#______________________________________________________________________________________________________________________________________________

def dreieck2(n, chars)
  ausgabe=""                                                                #ausgabe füllt sich im Laufe der Schleife mit den Zeichen
  for i in 1..n                                                             #baut die Ausgabe und erste Zeile des Dreiecks
    if (n%2==0)                                                          #wenn gerade Ziffer
      #Fehlermeldung
      printf("Achtung! %d muss eine ungerade und positive Ziffer sein! \n",n)
    else
      ausgabe<<"#{chars} "                                                  #platziert Zeichen 2 ans Ende des Strings auf den ausgabe zeigt
    end
  end

  puts ausgabe                                                              #stellt die erste Zeile des Dreiecks dar, von der sich die weiteren ableiten

  n.times do |i|                                                            #Baut alle weiteren Zeilen und hackt am Ende immer das letzte Zeichen ab (chop!) und packt zwei Leerzeichen vorne ran
    i+=1
    if check(n)
      ausgabe.chop!.chop!
      puts ("  "*i) + ausgabe
    else
      puts "Keine Ausgabe für n=#{n} möglich"
    end
  end
end

#______________________________________________________________________________________________________________________________________________

def dreieck3(n, chars)
  if(n%2==0)
    printf("Achtung! %d muss eine ungerade und positive Ziffer sein! \n", n)
  else
    for i in 1..n/2+1
      for j in 1..n
        if (i==n/2+1)
          puts chars * n
          break
        end
        print (j == ((n/2 + 1) - 1 + i) || j == ((n/2 + 1) + 1 - i) ) ? chars : " "
      end
      puts ""
    end
  end
end


#dreieck3(13,"o")
#______________________________________________________________________________________________________________________________________________

def kreuz(n, chars)
  if(n%2==0)
    printf("Achtung! %d muss eine ungerade und positive Ziffer sein! \n", n)
  else
    for i in 0..n
      if i==n
        break
      end

      for j in 0..n
        if j==n
          break
        elsif (j==n/2 || i==n/2)
          print chars
        else
          print "\s"
        end
      end
      print "\n"
    end
  end
end

#kreuz(8,"+")

#______________________________________________________________________________________________________________________________________________

def check(n)
  if n.is_a?(Integer) && n>=0
    return true
  else
    return false
  end

end

#______________________________________________________________________________________________________________________________________________


def auswahl
  puts("Willkommen in der Musterfabrik!\n" +
    "Geben Sie eine Zahl ein um eines der folgenden Muster auszuwählen oder \"exit\" um das \n" +
    "Programm zu beenden\n" +
    "1:Kreuz\n" +
    "2:Dreieck links\n"+
    "3:Dreieck rechts\n"+
    "4:gleichschenkliges Dreieck\n")
end

def interface()
  auswahl()
  befehl = gets.chomp.upcase
  case befehl
  when "1"
    eingeben = userEingabe()
    kreuz(eingeben[0],eingeben[1])

  when "2"
    eingeben = userEingabe()
    dreieck1(eingeben[0],eingeben[1])

  when "3"
    eingeben = userEingabe()
    dreieck2(eingeben[0],eingeben[1])

  when "4"
    eingeben = userEingabe()
    dreieck3(eingeben[0],eingeben[1])

  when "EXIT"
    puts "Tschüss!"
    Kernel.exit(false)
  else
    puts "ungültige Eingabe!"
  end

  interface()
end

def userEingabe()
  puts "Geben Sie eine ungerade ganze Zahl für Zeilen/Spalten des Musters ein"
  n = gets.chomp.to_i
  puts "Geben Sie ein Muster ein"
  chars = gets.chomp
  return [n, chars]
end

interface()

#def dreieck3(hoehe, symbol_außen, symbol_innen)
#  1.upto(hoehe) do |zeile|
#
#    print ' ' * (hoehe - zeile)
#
#    if zeile == 1
#      puts "#{symbol_außen * 2}"
#    elsif zeile == hoehe
#      puts symbol_außen * hoehe * 2
#    else
#      mitte = symbol_innen * (zeile - 2)
#      print "#{symbol_außen}#{mitte}#{symbol_innen}"
#      puts "#{symbol_innen}#{mitte}#{symbol_außen}"
#    end
#  end
#end
#
#dreieck3(7, "o", " ")
#_________________________________________________