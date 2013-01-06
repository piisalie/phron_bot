require 'yaml'
require_relative 'twitterconfig'

words = open("words.yaml") {|f| YAML.load(f)}
random_number = rand(1..words.length)

if File.exists?("used_words.yaml")
  used_words = open("used_words.yaml") {|f| YAML.load(f)}
else
  used_words = Hash.new
end

Twitter.update("Today's word is: " + words.keys[random_number].capitalize + 
  " (" + words.values[random_number] + ") from http://phrontistery.info")

used_words[words.keys[random_number]] = words.values[random_number]
open("used_words.yaml", 'w') { |f| YAML.dump(used_words, f) }

#words.delete(words.keys[random_number])
#open("words.yaml", "w") {|f| YAML.dump(words, f)}
