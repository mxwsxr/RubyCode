class Tupel
  
  #evtl. comparable inkludieren, protected:
  
  attr_reader :a, :b
  
  def initialize(a ,b)
    @a = a 
    @b = b
  end
  
#  def initialize(eintrag_eins, eintrag_zwei)
#    @tupel = Array.new(eintrag_eins, eintrag_zwei)  
#    @tupel.freeze()
#  end
  
#    def ==(other)
#       return false if other.nil?
#       return true if self.equal?(other)
#       return false if self.class != other.class
#       return [@a,@b]==([other.a, other.b])   
#     end
 
  def eql?(other)
    return false if other.nil? 
    return true if self.equal?(other)
    return false if self.class != other.class
    return [@a,@b].eql?([other.a, other.b])                                       #warum wird hier eql? verwendet, ist das nicht rekursiv? 
  end
  
  def hash()
    [@a,@b].hash                                             #jetzt haben bspw. (2,1) und (1,2) denselben Hashwert, sind diese auch eql?()
  end
  
  def to_s
   return "#{@tupel}"                                     
  end
  
  
end

t1=Tupel.new(12,6)
t2=Tupel.new(12,6)
t3=Tupel.new(12,6)
t4=Tupel.new(12,6)
t5=Tupel.new(12,6)
t6=Tupel.new(12,6)
puts t1
puts t2
puts t3
puts t4
puts t5
puts t6