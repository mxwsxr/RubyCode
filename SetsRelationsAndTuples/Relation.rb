require "Potenzmenge"

class Relation
  
  include Enumerable

  def initialize(set_a, set_b)
    @einträge = Set.new()
    @set_a = set_a
    @set_b = set_b
  end
  
  def add(a_tupel)
    @einträge << a_tupel
  end
  
  def size()
    #braucht man diese Methode überhaupt schreiben. Set implementiert ja bereits eine Methode.
  end
  
  def each(&block)
    @einträge.each(&block) 
  end
  
  def reflexiv?()
    @einträge.each{|eintrag| eintrag.each{
      |k,v| unless k == v                          
        return false
      end}
    }
    return true
  end
  
  def symmetrisch?()  
    @einträge.each{|eintrag| 
      prüf_eintrag = eintrag.reverse
      unless @einträge.include?(prüf_eintrag)
        return false
      end}  
    return true
  end
  
  def asymmetrisch?()  
    @einträge.each{|eintrag| 
      prüf_eintrag = eintrag.reverse
      if @einträge.include?(prüf_eintrag)
        return false
      end}  
    return true
  end
  
  def antisymmetrisch?()
    #ist das nicht dasselbe wie reflexiv?
  end
  
  def transitiv?()
  end
  
  def rechts_eindeutig?()
    
  end
  
  def links_eindeutig?()
  end
  
  def rechts_total?()
  end
  
  def links_total?()
  end
  
  def verknüpfe(andere_relation)
    self.merge(andere_relation)                                             #Set: falls Duplikat, dann wird es nicht eingefügt
  end
  
  def reflexiver_abschluss()
    array_a = (0..@set_a).to_a
    zip_array_a = array_a.zip(array_a)
    array_b = (0..@set_b).to_b
    zip_array_b = array_b.zip(array_b)    
    neue_relation = @einträge.merge(zip_array_a.to_set)                      #Set: falls Duplikat, dann wird es nicht eingefügt
    neue_relation.merge(zip_array_b.to_set)   
  end
  
  def symmetrischer_abschluss() 
    neue_relation = @einträge.each{|eintrag| @einträge.add(eintrag.reverse)}
  end
  
  def transitiver_abschluss()
    #transitive logik wiederverweden 
  end
  
  def kopiere()
  end
  
  def invertiere()
    @einträge.map{|eintrag| eintrag.reverse}
  end 
  
end


