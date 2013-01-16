module PhronBot
  class PickWord
    def initialize
      @dictionary = Dictionary.new
      @dictionary.load
      @pick = RandomNumber.new(@dictionary.length)
    end

    def word
      @dictionary.word(@pick.number).capitalize
    end

    def definition
      @dictionary.definition(@pick.number)
    end
  end
end
