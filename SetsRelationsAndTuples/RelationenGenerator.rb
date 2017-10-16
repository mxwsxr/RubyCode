require "Set"
require "Relation"
require "Tupel"

class RelationenGenerator
  
  def RelationenGenerator.generiere_relation(set_a,set_b, k)
     relation = Relation.new()
     for i in (0...k)
       tupel = Tupel.new(rand(set_a + 1), rand(set_b +1))
       relation.add(tupel)
     end
     puts relation   
  end
#
#  def RelationenGenerator.generiere_abbildung(set_a,set_b)
#    #TODO
#  end
  
end

RelationenGenerator.generiere_relation(100, 100, 5)