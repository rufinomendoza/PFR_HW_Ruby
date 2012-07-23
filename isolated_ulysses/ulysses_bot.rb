#!/bin/env ruby
# encoding: utf-8


require 'open-uri'

source_text = ""

open("http://www.gutenberg.org/files/4300/4300-h/4300-h.htm") do |f|
  f.each_line do |line|
    source_text += line
  end
end

source_text_words = source_text.split(' ')
word_pairs_and_probabilities = {}

#This splits the source text and puts it into hashes
source_text_words.each_with_index do |word, index|
  hash_key = "#{word} #{source_text_words[index + 1]}"
  hash_value = source_text_words[index + 2]
  if word_pairs_and_probabilities[hash_key]
    word_pairs_and_probabilities[hash_key] << hash_value
  else
    word_pairs_and_probabilities[hash_key] = [hash_value]
  end
end

#This part picks a random starting position
first_key = []
first = word_pairs_and_probabilities.keys.sample
first_key << first
first_key << word_pairs_and_probabilities[first].sample
first_triplet = first_key.join(' ').split(' ')

bot_output = []
bot_output << first_triplet.join(' ')

next_chain = first_triplet[1] + ' ' + first_triplet[2]

def continue(argument, thing)
  foo_key = []
  foo_key << thing
  foo_key << argument[thing].sample
  foo_phrase = foo_key.join(' ').split(' ')
  iterative_chain = foo_phrase[-2] + ' ' + foo_phrase[-1]
  return iterative_chain
end


zarg = continue(word_pairs_and_probabilities, next_chain)

10000.times do
  if zarg && zarg = continue(word_pairs_and_probabilities, zarg)
    fubar = zarg
    last = fubar.split(' ')[-1]
    bot_output << last
  end
end

#Need to work on Regexp
#bot_output = bot_output.gsub(/\r/,"")
#bot_output = bot_output.gsub(/\n/,"<br>")

bot_write = bot_output.join(' ').to_s
puts bot_write

File.open('ulysses.htm', 'w') do |f|
  f.write(bot_write)
end

#initial_triplet = []
#initial_triplet << word_pairs_and_probabilities.keys[0]
#initial_triplet << probable_following_words

#puts initial_triplet.to_s

#third_word = word_pairs_and_probabilities[probable_following_words]

#puts "#{probable_following_words} #{next_chain}"

#word_pairs_and_probabilities.keys.each do |keys|
#  puts "#{keys}"
#end

# simple_hash = {}
# simple_hash["they came"] =["down"]