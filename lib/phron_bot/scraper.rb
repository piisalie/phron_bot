module PhronBot
  class Scraper
    def url(letter)
      "http://phrontistery.info/#{letter}.html"
    end

    def read_pages(dictionary)
      ("a".."z").each do |letter|
        LetterPage.new(url(letter)).read_words(dictionary)
      end
    end

    def scrape
      dictionary = Dictionary.new
      read_pages(dictionary)
      dictionary.save
    end
  end
end
