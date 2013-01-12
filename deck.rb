module House
  class Deck  # on a house
    def initialize
      @exits = { }
    end
  end
end

module Cards
  class Deck  # of cards
    def initialize
      @cards = [ ]
    end
  end
end

p [House::Deck.new, Cards::Deck.new]

# lib/house/deck.rb
# lib/house/bathroom.rb
# lib/house.rb

# lib/cards/deck.rb
