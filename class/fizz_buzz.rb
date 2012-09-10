# (1..100).each do |number|
# initialize number
number = 1
# do this 100 times
100.times do #they can also go at the end of the lines
# modulo operator finds the remainder 
	if(number % 15 == 0)
		puts "Fizz Buzz"
	elsif (number % 3 == 0)
		puts "Fizz"
	elsif(number % 5 == 0)
		puts "Buzz"
	else
		puts number		
	end
	number = number + 1 #increment
end


# you can also do it with curly braces but prefer do for multi lines
# 100.times {do #they can also go at the end of the lines}
#	puts number
#	number = number + 1
#}

# you would use curly braces for one line
# 100.times {puts number; number = number + 1;}

puts ""

(1..100).each do |number| #they can also go at the end of the lines
# modulo operator finds the remainder 
	if(number % 15 == 0)
		puts "Fizz Buzz"
	elsif (number % 3 == 0)
		puts "Fizz"
	elsif(number % 5 == 0)
		puts "Buzz"
	else
		puts number		
	end
end

#demonstrating the index for an array

puts ""

abc = ['a', 'b', 'c']
array = abc
array.each { |a| puts a }
puts ""

array.each { |value| puts value }
puts ""

puts array.first
puts ""

puts array[0]
puts ""

puts array.last
puts ""

array.each_with_index { |value, index| puts "#{value} #{index}" }