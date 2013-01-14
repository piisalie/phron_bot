require_relative '../../config/twitterconfig.rb'

module PhronBot
  class Tweet
    def initialize
      @pick = PickWord.new
      Twitter.update("Today's word is: #{@pick.word} (#{@pick.definition}) from http://phrontistery.info")
    end
  end
end
