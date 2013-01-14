require "yaml"

module PhronBot
  class Dictionary
    DATA_FILE = File.join(File.dirname(__FILE__), *%w[.. .. data words.yaml])

    def initialize
      @words = { }
    end

    def length
      @words.length
    end

    def add_word(word, definition)
      @words[word] = definition
    end

    def word(index)
      @words.keys[index]
    end

    def definition(index)
      @words.values[index]
    end

    def save
      open(DATA_FILE, "w") { |f| YAML.dump(@words, f) }
    end

    def load
      @words = open(DATA_FILE, "r") { |f| YAML.load(f) }
    end
  end
end
