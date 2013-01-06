require 'nokogiri'
require 'open-uri'
require 'yaml'

addyarray = []
wordhash = {}

("a".."z").to_a.each {|i| addyarray << "http://phrontistery.info/#{i}.html"}

addyarray.each do |url|
  puts "Working on #{url}"
  page = Nokogiri::HTML(open(url))
  page.css("tr")[4..-1].each do |i|
   wordhash[i.css("td")[0].text.chomp] = i.css("td")[1].text.chomp
  end
end

open("words.yaml", 'a') { |f| YAML.dump(wordhash, f) }