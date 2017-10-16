# A Ruby-Code for 2 mathematical functions
# The first one is a formula for log(x) with dependency of ln(x,n)
# The second one is the factorial function.
#
# Author:: Albert Schuman
#_______________________________________________________________________________________
# Näherungsformel für Math.log(x) mit ln(x,n)

def ln(x,n)
  if (x <= 0.5)                                         # x darf nicht kleiner-gleich 0.5 sein
    return nil
  elsif (n<1)                                           # der Grenzwert n darf nicht unter 1 liegen
    return nil
  end
  
  ergebnis = 0

  for i in (1..n)                                       # Näherungsformel: zählt von i=1 bis n
    ergebnis = ergebnis + ((x-1)**i)*1.0/(i*(x**i))     # gegebene Formel
  end
  return ergebnis
end

puts ln(5,50)
puts "\n"
#_______________________________________________________________________________________
# Formel für die Berechnung des Fakultätsprodukts

def fakultaet(n)
  (1..n).reduce(:*) || 1
end

puts fakultaet(5)


# As you can see here down below, I had 2 previous versions which were
# doing the same thing as the one above but they are unnecessarily too long
# and the runtime takes longer than the final versions


#  if (n <= 1)                                           # der Fakultätswert n darf nicht kleiner-gleich 1 sein
#    return nil
#  end
#  if (n == 1 || n == 0)
#    return nil
#  end
#  
#  fak_prod = 1                                          # das leere Fakultätprodukt ist immer 1
#                                                        # weil 1! = 1
#  for k in (1..n)
#    fak_prod = fak_prod * k
#  end
#  return fak_prod
#end
#
#puts fakultaet(10)
#puts "\n"
#_______________________________________________________________________________________
#def f(a,x,n)
#  if (n <= 1)
#    return nil
#  end
#  
#  summe = 0
#  
#  for i in (0..n)
#    summe = summe + ((ln(a)^i/fakultaet(i))*x^i)
#  end
#  return summe  
#end
#
#puts f(2,2,100)
#puts "\n"