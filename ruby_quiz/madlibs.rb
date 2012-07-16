madlibs = []

def prompt
	print "> "
end

puts "Pick a verb, past tense"
prompt; word = gets.chomp
madlibs << word

puts "Pick a number"
prompt; word = gets.chomp
madlibs << word

puts "Pick a plural noun"
prompt; word = gets.chomp
madlibs << word

puts "Pick another plural noun"
prompt; word = gets.chomp
madlibs << word

puts "Pick a noun"
prompt; word = gets.chomp
madlibs << word

puts "Pick a verb ending in ing" #index5
prompt; word = gets.chomp
madlibs << word

puts "Pick an adjective"
prompt; word = gets.chomp
madlibs << word

puts "Pick a plural noun"
prompt; word = gets.chomp
madlibs << word

puts "Pick a color"
prompt; word = gets.chomp
madlibs << word

puts "Pick an adverb"
prompt; word = gets.chomp
madlibs << word

puts "Pick a verb ending in s" #index 10
prompt; word = gets.chomp
madlibs << word

puts "Pick a body part"
prompt; word = gets.chomp
madlibs << word

puts "Pick an adverb"
prompt; word = gets.chomp
madlibs << word

puts "Pick a verb, past tense"
prompt; word = gets.chomp
madlibs << word

puts "Pick a noun"
prompt; word = gets.chomp
madlibs << word

text = <<EOM
I #{madlibs[0]} to the sandwich shop across the street for lunch
yesterday. I go there at least #{madlibs[1]} times a week. They have the best
Philly Cheesesteak, full of #{madlibs[2]} and #{madlibs[3]} and gooey,
stringy #{madlibs[4]}. They prepare it just right, #{madlibs[5]} it
until the meat breaks up and browns, but is still #{madlibs[6]} and juicy.
Then they add special #{madlibs[7]} and place two pieces of delicious #{madlibs[8]}
provolone cheese on top of the meat. As soon as it melts, they scoop the
whole thing up and plop it on a #{madlibs[9]} toasted bun.  The juice #{madlibs[10]}
into the bread and runs down your #{madlibs[11]} when you bite into it.
Perfect! My mouth was watering just thinking about it. I #{madlibs[12]}
placed my order, dreaming of my Cheesesteak sandwich. As soon as it was ready,
I #{madlibs[13]} back to my office and settled down to savor every mouth
watering bite.  But, wouldn't you know, they'd given me a #{madlibs[14]} on rye
instead!

EOM

puts text