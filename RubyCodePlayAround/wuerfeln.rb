

#----------------------------------------------------------------------------------
#Gibt eine zufällige Zahl zwischen 1 und 49 aus, wobei 1 und 49 eingeschlossen
#sind
#----------------------------------------------------------------------------------

def lotto_zahl()
  puts rand(1..49)
end

#----------------------------------------------------------------------------------
#Gibt aus wie oft es gebraucht hat bis eine Zahl gewürfelt wurde. Diese wird als
#Parameter mitgegeben
#----------------------------------------------------------------------------------

def anzahl_wuerfe_fuer(zahl)
  if zahl>=1 && zahl<=6
    counter=0
    ergebnis=nil
    while ergebnis!=zahl
      ergebnis=rand(1..6)
      counter+=1
    end
    return counter
  else
    return nil

  end
end

#----------------------------------------------------------------------------------
#Gibt aus wie lange es braucht bis eine Zahl in einer bestimmten Folge gewürfelt
#wurde. Vorige Methode wird genutzt
#----------------------------------------------------------------------------------

def anzahl_versuche_fuer_zahl_in_folge(zahl,folge)
  counter = 0
  versuche = 0
  while counter != folge
    if anzahl_wuerfe_fuer(zahl) == 1
      counter +=1
    else
      counter = 0
      versuche +=1
    end
  end
  return versuche
end

#----------------------------------------------------------------------------------
#Nutzt die vorige Methode um zu sagen wann jemand eine Zahl in einer bestimmten
#Folge gewürfelt hat
#----------------------------------------------------------------------------------

def the_winner_takes_it_all(zahl,folge)
 puts "Spieler #{anzahl_versuche_fuer_zahl_in_folge(zahl,folge)} hat gewonnen"
end

10.times do lotto_zahl
end


#anzahl_versuche_fuer_zahl_in_folge(1, 5)
#the_winner_takes_it_all(7,6)