require "open-uri"
require "nokogiri"

module PhronBot
  class LetterPage
    def initialize(url)
      @url = url
    end

    def html
      open(@url) { |page| Nokogiri.HTML(page) }
    end

    def read_words(dictionary)
      html.css("table.words tr")[1..-1].each do |word_table_row|
        word       = word_table_row.css("td").first.text.strip
        definition = word_table_row.css("td").last.text.strip
        dictionary.add_word(word, definition)
      end
    end
  end
end
