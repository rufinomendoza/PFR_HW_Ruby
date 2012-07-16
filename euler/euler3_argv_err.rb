#The error here was the first argument needed to be turned into an integer.

first = ARGV.first.to_i

def generate(n)
	return [] if n == 1
	factor = (2..n).find {|x| n % x == 0}
	[factor] + generate(n / factor)
end

primes = generate(first)

puts primes

biggest = primes.max

puts biggest