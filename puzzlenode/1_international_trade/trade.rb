require 'crack/xml'
require 'csv'
require 'bigdecimal'

def bankers_round(n, deg)
  #This is the method that supposedly has the bug
  foo = BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_HALF_EVEN)
  foo.to_f
  #The currently active method below is modified from https://gist.github.com/1053857
  #cents = BigDecimal(n.to_s) * BigDecimal("100")
  #remainder = cents % BigDecimal("1")
  #if remainder == BigDecimal("0")
  #  n
  #elsif remainder < BigDecimal("0.5")
  #  BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_DOWN)
  #elsif remainder > BigDecimal("0.5")
  #  BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_UP)
  #elsif cents.even?
  #  BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_DOWN)
  #else
  #  BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_UP)
  #end
end

def convert(functional, parent, fx, cross_curr)
  functional.each do |trans|
    foo = (trans * fx[cross_curr])
    converted = bankers_round(foo, 2)
    parent << converted
  end
end

#This section changes the fx rates to something manageable

rates = File.open('RATES.xml')
fx_rates = rates.read
rates.close

fx_rates = Crack::XML.parse(fx_rates)
fx_rates = fx_rates["rates"]
fx_rates = fx_rates["rate"]

fx = Hash.new
fx_rates.each do |index|
	f = index["from"]
	t = index["to"]
	key = f+t
	c = index["conversion"].to_f
	fx[key] = c
end

fx["AUDUSD"] = fx["AUDCAD"] * fx["CADUSD"]
fx["EURUSD"] = fx["EURAUD"] * fx["AUDUSD"]

#This section starts manipulating the transactions

trans_array = []
trans = CSV.foreach("TRANS.csv") do |row|
	trans_array << row
end

#This section filters for all transactions
trans_sku = []

trans_array.each do |row|
	if row.include? ("DM1182")
		trans_sku << row.last.split(' ')
  end
end

trans_sku.each do |row|
  row = row.first.to_f
end

#Split transactions by currency

USD = []
AUD = []
CAD = []
EUR = []

trans_sku.each do |row|
  if row.include? ("USD")
    USD << row.first.to_f
  elsif row.include? ("AUD")
    AUD << row.first.to_f
  elsif row.include? ("CAD")
    CAD << row.first.to_f
  elsif row.include? ("EUR")
    EUR << row.first.to_f
  end
end

#Convert currencies into USD
convert(AUD, USD, fx, "AUDUSD")
convert(EUR, USD, fx, "EURUSD")
convert(CAD, USD, fx, "CADUSD")

#Add the USD transactions together
sum = USD.inject(0) { |sum, x| sum + x}
sum = bankers_round(sum, 2)

#puts USD.to_s
puts sum
#print '134.22'
#print was a check for sample rates

#Write file solution
File.open('OUTPUT.txt', 'w') {|f| f.write(sum) }