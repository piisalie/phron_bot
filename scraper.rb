require 'nokogiri'
require 'open-uri'
require 'yaml'

urls = ("a".."z").map {|letter| "http://phrontistery.info/#{letter}.html"}
wordhash = {}

urls.each do |url|
  puts "Working on #{url}"
  page = Nokogiri::HTML(open(url))
  page.css("tr")[4..-1].each do |i|
   wordhash[i.css("td")[0].text.chomp] = i.css("td")[1].text.chomp
  end
end

open("words.yaml", 'w') { |f| YAML.dump(wordhash, f) }