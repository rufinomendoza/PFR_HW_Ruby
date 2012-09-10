source_text = <<EOF

Galleys of the Lochlanns ran here to beach, in quest of prey, their bloodbeaked prows riding low on a molten pewter surf. Dane vikings, torcs of tomahawks aglitter on their breasts when Malachi wore the collar of gold. A school of turlehide whales stranded in hot noon, spouting, hobbling in the shallows. Then from the starving cagework city a horde of jerkined dwarfs, my people, with flayers' knives, running, scaling, hacking in green blubbery whalemeat. Famine, plague and slaughters. Their blood is in me, their lusts my waves. I moved among them on the frozen Liffey, that I, a changeling, among the spluttering resin fires. I spoke to no-one: none to me.

EOF

def split_text_into_pairs_of_words(text)
	new_pair_array = []
	text_array = text.split(" ")
	text_array.each_with_index do |word, index|
		new_pair_array << "#{word}, #{text_array[index + 1]}" #chevron
	end
	new_pair_array #This is functionally the same as saying return because it will always return the last line
end

my_new_pair_array = split_text_into_pairs_of_words(source_text)

def record_the_probability(text)
	hash_of_probabilities = {}
	text_array = text.split(" ")
	text_array.each do |word, index|
		temp_array = hash_of_probabilities[word] << text_array[index + 1]
end

#puts my_new_pair_array

#record_the_probability
#generate_random_text