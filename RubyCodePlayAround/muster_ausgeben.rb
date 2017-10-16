#--------------------------------------------------------------------------------
#zeichnet Dreieck in Konsole
#negative Eingaben werden hierbei mit einer Fehlermeldung beantwortet
#--------------------------------------------------------------------------------

def dreieck(n,zeichen)
  
  if check(n)
    n.times do |i|
      puts "#{zeichen} "*(i+1)
    end
  else puts "Keine Ausgabe für n=#{n} möglich"
  end
end

#--------------------------------------------------------------------------------
#zeichnet Dreieck mit alternierenden Zeichen 1 und 2 und n Zeilen
#wobei Dieses sowohl in Spalten als auch Zeilen durchnummeriert sind
#Das Problem mit dem Versatz bei mehrstelligen Zahlen muss noch gelöst werden
#--------------------------------------------------------------------------------

def dreieck_alternierend(n,zeichen1,zeichen2)
  #baut die Kopfzeile mit den Zahlen
  max_laenge=n.to_s.length
  print " "*(max_laenge+1)
  n.times do |i|
    printf("%-#{max_laenge}s ",i+1)
  end

  ausgabe=""
  puts "\n"
  for i in 0..n
  #wenn gerade
    if (i)%2==0 && check(n)
      ausgabe.insert(0,("#{zeichen1}"+" "*max_laenge))
      printf("%-#{max_laenge}s ",i+1)
      puts ausgabe
  #wenn ungerade
    elsif (i)%2==1 && check(n)
      ausgabe.insert(0,("#{zeichen2}"+" "*max_laenge))
      printf("%-#{max_laenge}s ",i+1)
      puts ausgabe
    else
      puts "Keine Ausgabe für n=#{n} möglich"
    end
  end
end

#-----------------------------------------------------------------------------------
#Gibt ein Dreieck aus das oben groß ist und sich nach unten verjüngt, wobei hier
#dieselben Regeln der Zeichenanordnung wie in dreieck_alternierend gelten
#-----------------------------------------------------------------------------------

def dreieck_alternierend_oben(n,zeichen1,zeichen2)
  #ausgabe füllt sich im Laufe der Schleife mit den Zeichen 1 und 2
  ausgabe=""
  #baut die Ausgabe und erste Zeile des Dreiecks
  for i in 1..n
    if (i+1)%2==0  #wenn gerade
      #platziert Zeichen 1 ans Ende des Strings auf den ausgabe zeigt
      ausgabe<<"#{zeichen1} "
    else #wenn ungerade
      #platziert Zeichen 2 ans Ende des Strings auf den ausgabe zeigt
      ausgabe<<"#{zeichen2} " 
    end
  end
  #stellt die erste Zeile des Dreiecks dar, von der sich die weiteren ableiten
  puts ausgabe
  #Baut alle weiteren Zeilen und hackt am Ende immer das letzte Zeichen ab (chop!) und packt zwei Leerzeichen vorne ran
  n.times do |i|
    i+=1
    if check(n)
      ausgabe.chop!.chop!
      puts ("  "*i)+ausgabe
    else
      puts "Keine Ausgabe für n=#{n} möglich"
    end
  end
end

#----------------------------------------------------------------------------------
#Zeichnet eine Diagonale aus gegebenen Zeichen mit n Zeilen in Zeilenbreite breite
#deren Zeichenlänge sich abschneidet um sich in einem gedachten Quadrat zu zeigen
#----------------------------------------------------------------------------------

def diagonale (n,zeichen,breite)
  if check(n) && check(breite)
    filler=""
    start=("#{zeichen} "*breite)
    finish=("#{zeichen} "*breite)
    #Schneidet das vordere Zeichen ab (plus dem Leerzeichen)
    start.slice!(0,2)
    puts start
    #stellt die Diagonale nach der ersten Zeile bis vor die letzte Zeile dar
    (n-2).times do
      puts "#{filler}"+("#{zeichen} "*breite)
      filler+="  "
    end
    #Stellt die letzte Zeile dar. Macht dasselbe wie slice am Anfang nur hier mit chop, weil die letzten Zeichen weg sollen
    puts filler+"#{finish.chop.chop}"
  else
    puts "Keine Ausgabe für mit diesen Parametern möglich"
  end
end

#----------------------------------------------------------------------------------
#prüft ob n eine ganze Zahl (integer) ist und somit als Eingabe genommen werden darf
#prüft außerdem ob n größer 0 und somit nicht negativ ist
#----------------------------------------------------------------------------------

def check(n)
  if n.is_a?(Integer) && n>=0
    return true
  else
    return false
  end

end

dreieck(1,:*)
dreieck(-5,:'(')
dreieck(5,:ß)

puts "\n"*3

dreieck_alternierend(10,:-,:o)

puts "\n"*3

dreieck_alternierend_oben(9,:x,:'@')

puts "\n"*3

diagonale(7,:'°',3)