# A Ruby program to show whether a given number 
# from user is decimal, octal or hexadecimal number
#
# Author:: Albert Schuman
#

# hier werden die 3 Zahlensysteme vorgegeben
Dezimal = "0123456789"
Oktal   = "01234567"
Hexa    = "0123456789ABCDEF"

def dezimal_ziffer?(char)
  return Dezimal.include?(char)
end

def oktal_ziffer?(char)
  return Oktal.include?(char)
end

def hexadezimal_ziffer?(char)
  return Hexa.include?(char)
end

def dezimal?(string)
  dezimal = string.split('')

  if (string == "")
    return nil
  elsif (dezimal[0] == '0')
    return nil
  end

  for k in(0...dezimal.size)
    if not (dezimal_ziffer?(dezimal[k]))
      return nil
    end
  end
end

def oktal?(string)
  oktal = string.split("")

  if (string == "")
    return nil
  end

  for k in (0...oktal.size)
    if not(oktal_ziffer?(oktal[k]))
      return nil
    end
  end
end

def hexadezimal?(string)
  hexal = string.split("")

  if (hexal[0] != '0' || hexal[1] != 'x' || hexal.size<3)
    return nil
  end

  for k in (2...hexal.size)
    if not(hexadezimal_ziffer?(hexal[k]))
      return nil
    end
  end
end

def zahlenmenue()
  puts "Wir analysieren die Eingabe auf ganzzahlige Werte im Dezimal- / Oktal- und Hexadezimalsystem:\n"
  while(true)
    puts "Bitte führen Sie eine Eingabe durch:\n"
    zahl = gets.chomp.delete(" ")

    if dezimal?(zahl)
      puts "#{zahl} ist eine Zahl im Dezimalsystem."
    elsif oktal?(zahl)
      puts "#{zahl} ist eine Zahl im Oktalsystem."
    elsif hexadezimal?(zahl)
      puts "#{zahl} ist eine Zahl im Hexadezimalsystem."
    elsif zahl == "exit"
      puts "Tschüss! Bis zum nächsten Mal :)"
      break
    else
      puts "#{zahl} ist keine Zahl im Dezimal- / Oktal- oder Hexadezimalsystem!"
    end
  end
end

zahlenmenue()