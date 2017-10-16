require "Potenzmenge"

class Relation
  
  include Enumerable

  def initialize(set_a, set_b)
    @relation = Set.new()
    @set_a = set_a
    @set_b = set_b
  end
  
  def add(a_tupel)
    @relation << a_tupel
    return self                                                                                                       #warum muss hier nochmal return self stehen?
  end
  
  def size()
     @relation.size()                                                                                             #braucht man diese Methode überhaupt schreiben. Set implementiert ja bereits eine Methode.
  end
  
  def each(&block)
    @relation.each(&block) 
  end
  
 def reflexiv?() 
   new_set = @relation.flat_map{|k,v| [k,v]}                                                          #alternative: .flatten , werden Duplikate automatisch entfernt?, evtl.sort verwenden ,  alternativ: |e|  e                                                                  
   for e in new_set.size()
         if !(@relation.include?([new_set[e],new_set[e]])
            return false
end
end
end
  
#  def symmetrisch?()  
#    for e in self.size()
#      if !(self.include?(self[e].reverse_each))                                                         #funktion  von reverse_each testen, alternative .reverse
#        return false
#    end
#    return true
#  end
  
  def symmetrisch?()
    all? { |tuple| include?(tuple.reverse)}
  end
  
  def asymmetrisch?()
     !symmetrisch?() 
  end
  
#  def asymmetrisch?()  
#    for e in self.size()
#      if self.include?(self[e].reverse_each)                                                              
#        return false
#    end
#    return true
#  end
  
#  def asymmetrisch?()
#    all? { |tuple| !include?(tuple.reverse)} 
#  end
   
  def antisymmetrisch?()  #asymmetrie + (kann (a,a), (b,b), (c,c), (d,d) enthalten)
    for e in self.size()
      reverse_tupel = self[e].reverse_each                                                                   #funktion  von reverse_each testen, alternative .reverse
      if self.include?(reverse_tupel) 
           unless reverse_tupel == self[e]                 
              return false
            end
       end
    end
    return true
  end
  
#def antisymmetrisch?
#    all? { |tuple| !include?(tuple.reverse) || tuple.a == tuple.b } 
#end
  
def transitiv?()
  for e in self.size()
    value = self [e][1]
    array = self.find_all{ |tuple| value == tuple.b}
    for i in array.size()
      if !(self.include?(array[i]))
        return false
      end
    end
  end
end

#def transitiv?
#     all? do |t|
#    all? { |tp| t.b != tp.a || include?(Tupel.new(t.a, tp.b)) }
#  end
#end

  def rechts_eindeutig?()
    
    #für alle Zahlen aus A gibt es höchstens einen Wert aus B
  end
  
  def links_eindeutig?()
    #für alle Zahlen aus B gibt es höchstens einen Wert aus A
  end
  
  def rechts_total?()#alle Zahlen aus B sind vorhanden 
    array_b = set_b.to_a 
    for e in array_b 
        if! (all? {|tuple| include?(tuple.b == (array_b[e])})
           return false
        end
  end
    return true
  end
  
  def links_total?()
    #alle Zahlen aus A sind vorhanden
  end
  
  def verknüpfe(andere_relation)
    self.merge(andere_relation)                                             #Set: falls Duplikat, dann wird es nicht eingefügt
  end
  
  def reflexiver_abschluss()
    array_a = (0..@set_a).to_a
    zip_array_a = array_a.zip(array_a)
    array_b = (0..@set_b).to_a
    zip_array_b = array_b.zip(array_b)    
    neue_relation = @einträge.merge(zip_array_a.to_set)                      #Set: falls Duplikat, dann wird es nicht eingefügt
    neue_relation.merge(zip_array_b.to_set)   
  end
  
  def symmetrischer_abschluss() 
    neue_relation = @relation.each{|eintrag| @relation.add(eintrag.reverse)}
  end
  
  def transitiver_abschluss()
    #transitive logik wiederverweden 
  end
  
  def kopiere()
  end
  
  def invertiere()
    @relation.map{|eintrag| eintrag.reverse}
  end 
  
def to_s()
   "#{@relation}"
 end
end


r = Relation.new()
r.add([2,1])
r.add([1,2])
r.add([1,1])
r.add([2,2])
#r1 = [[2, 1], [1, 2], [1, 1],[2, 2]].to_set
puts r
