require "yaml"

module PhronBot
  class Dictionary
    DATA_FILE = File.join(File.dirname(__FILE__), *%w[.. .. data words.yaml])

    def initialize
      @words = { }
    end

    def add_word(word, definition)
      @words[word] = definition
    end

    def save
      open(DATA_FILE, "w") { |f| YAML.dump(@words, f) }
    end
  end
end
