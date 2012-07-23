# skipped the keystream
# discarded non-A to Z characters
string = "Code in Ruby, live longer! 123"
string
string.gsub(/\W/,'')
string.gsub(/\W \d/, '')
string.gsub(/[\W \d]/,'')


string.chars.each { |s| puts s}
#string is an array of characters underneath

('A'..'Z').to_a


string.upcase
#make this uppercase

string.upcase!
#When we call it with the exclamation point, it will actually change the variable
#Bang operator

string.upcase.chars.each {|char| ('A'..'Z').to_a.include?(char) }
#This value will return true or false: ('A'..'Z').to_a.include?(char)

new_str = "123"
new_str.charts.to_a
new_str.chars.to_a.include?("1")
new_str.chars.to_a.include?("B")

string.chars.each do { |char| char = "9" if char == "R" }
new_array = []
string.chars.each do |char|
	if char == "R"
	char = "9"
	new_array << char
end

new_array