require "Set"
require "Relation"
require "Tupel"

class RelationenGenerator
  
  def RelationenGenerator.generiere_relation(set_a,set_b, k)
     relation = Relation.new(set_a,set_b)
     array_1 = set_a.to_a
     array_2 = set_b.to_a
     size_1 = array_1.size()
     size_2 = array_2.size()
    until relation.size == k                                                                                                      
       tupel = Tupel.new(array_1[rand(size_1)],array_2[rand(size_2)])             #der index wird randomisiert ausgegben
       relation.add(tupel)
     end
     return relation   
  end

  def RelationenGenerator.generiere_abbildung(set_a,set_b)
    #TODO
  end
  
  def abbildung?()
    return relation.links_total?() && relation.rechts_eindeutig?()                        #kann ich hier relation schreiben oder muss es @einträge sein?
  end
  
  def injektiv?()
    return relation.links_total?() && links_eindeutig?() && rechts_eindeutig?()
  end
  
  def surjektiv?()
    return relation.links_total?() && relation.rechts_total?() && rechts_eindeutig?()
  end
  
  def urbild()
    if abbildung?()
    end
  end
  
end

#RelationenGenerator.generiere_relation(10, 6, 5)
puts RelationenGenerator.generiere_relation(2, 2, 5)