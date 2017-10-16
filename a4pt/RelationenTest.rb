require "test/unit"
require "Relation"
require "Tupel"
require "Set"
require "RelationenGenerator"
require "Potenzmenge"

class RelationenTest < Test::Unit::TestCase
  def setup()
    @r1 = [[2, 1], [1, 2], [1, 1],[2, 2]].to_set #reflexiv, symmetrisch,transitiv
    
   end
    
    def test_positiv()
    end
    
    def test_negativ()
    end
    
    def grenzfaelle()
    end
end

