require "yaml"

module PhronBot
  class RandomNumber
    LOG_FILE = File.join(File.dirname(__FILE__), *%w[.. .. data usednumbers.yaml])
    attr_reader :number

    def initialize(upper_limit)
      @upper_limit = upper_limit
      load
      @number = get_number
    end

    def random_number
      rand(1..@upper_limit)
    end

    def save
      open(LOG_FILE, "w") { |f| YAML.dump(@used_numbers, f) }
    end
  
    def load
      if File.exists?(LOG_FILE)
        @used_numbers = open(LOG_FILE, "r") { |f| YAML.load(f) }
      else
        @used_numbers = []
      end
    end

    def get_number
      number = random_number
      while @used_numbers.include?(number)
        number = random_number
      end
      @used_numbers << number
      save
      return number
    end
  end
end
