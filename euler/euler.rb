# Euler 1 Problem: 3 and 5 multiple sum
total = 0
number = 0

(1..999).each do |number|
	if number % 3 == 0
		total = number + total
	elsif number % 5 == 0
		total = number + total
	else
		next
	end
end
puts "The solution for Euler 1 is #{total}.\n\n"

#Euler 2 Problem: fibonacci
fib_total = 0
fib_previous = 0
fib_current = 1

while fib_current < 4000000 do
	fib_previous, fib_current = fib_current, fib_previous + fib_current
	if fib_current % 2 == 0
		fib_total = fib_current + fib_total
	else
		next
	end
end
puts "The solution for Euler 2 is #{fib_total}.\n\n"

#Euler 5 Problem:

puts "For Problem 5:\n
\tI'm sure there's a more automagic way to do this...
\tBut due to the speed of the algorithm, make yourself
\ta cup of coffee, and it should be done when you get back.

\tCalculating...
\n"

#I know it has to be less than 20! so we set that as our upper limit
upper_limit = 1
(1..20).each do |number|
	upper_limit = number * upper_limit	
end

#Now we go through each number until we get a result that passes all
#the divisibility tests.

a = Array.new

(1..upper_limit).each do |number|
	if number % 2 == 0 and
		number % 3 == 0 and
		number % 4 == 0 and
		number % 5 == 0 and
		number % 6 == 0 and
		number % 7 == 0 and
		number % 8 == 0 and
		number % 9 == 0 and
		number % 10 == 0 and
		number % 11 == 0 and
		number % 12 == 0 and
		number % 13 == 0 and
		number % 14 == 0 and
		number % 15 == 0 and
		number % 16 == 0 and
		number % 17 == 0 and
		number % 18 == 0 and
		number % 19 == 0 and
		number % 20 == 0 and
		a.push(number)
		if a.length < 1 #this is how to keep it from continuing needlessly
		else
			break
		end
	else
		next
	end
end
puts "\tThe solution for Euler 5 is #{a.first}.\n\n"