# A program for rolling cubes to play
# Author:: Albert Schuman

def gewuerfelt?(zahl,von,bis)
  
  if zahl>=1 && zahl <=49
    ergebnis=nil
    while ergebnis==zahl
      ergebnis=rand(1..49)
    end
    return true
  end
end

10.times do gewuerfelt?(6,1,49)
end
