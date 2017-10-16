class Tupel
  
  attr_reader :tuple 
  
  def initialize(eintrag_eins, eintrag_zwei)
    @tupel = Array.new(eintrag_eins, eintrag_zwei)      # beliebige Tupel mit 2 Einträgen
    @tupel.freeze()                                     # @tupel konstant machen
  end
  
  def eql?(other)
    return false if other.nil? 
    return true if self.equal?(other)
    return false if self.class != other.class
    return  @tuple.eql?(other.tupel)             
  end
  
  def hash()
    @tuple.hash
  end
end