require 'crack/xml'
require 'csv'

def bankers_round(n)
  return n.round(2)
end

def convert(functional, parent, fx, cross_curr)
  functional.each do |trans|
    foo = (trans * fx[cross_curr])
    converted = bankers_round(foo)
    parent << converted
  end
end

#This section changes the fx rates to something manageable

rates = File.open('SAMPLE_RATES.xml')
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

fx["AUDUSD"] = bankers_round(fx["AUDCAD"] * fx["AUDCAD"])
#fx["EURUSD"] = fx["EURAUD"] * fx["AUDUSD"]
#Uncomment for final
#Also fix bankers round

#This section starts manipulating the transactions

trans_array = []
trans = CSV.foreach("SAMPLE_TRANS.csv") do |row|
	trans_array << row
end

#This section filters for all transactions
tr_sku = []

trans_array.each do |row|
	if row.include? ("DM1182")
		tr_sku << row.last.split(' ')
  end
end

tr_sku.each do |row|
  row = row.first.to_f
end

#Split transactions by currency

USD = []
AUD = []
CAD = []
EUR = []

tr_sku.each do |row|
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

puts USD.to_s
puts sum

#Write file solution
File.open('OUTPUT.txt', 'w') {|f| f.write(sum) }