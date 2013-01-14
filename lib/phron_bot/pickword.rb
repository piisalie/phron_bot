module PhronBot
  class PickWord
    def initialize
     @dictionary = Dictionary.new
     @dictionary.load
     @random_number = rand(1..@dictionary.length)
    end

    def word
      @dictionary.word(@random_number).capitalize
    end

    def definition
      @dictionary.definition(@random_number)
    end
  end
end
