def bankers_round(n, deg)
  foo = BigDecimal(n.to_s).round(deg, BigDecimal::ROUND_HALF_EVEN)
  foo.to_f
end

def convert(functional, parent, fx, cross_curr)
  functional.each do |trans|
    foo = (trans * fx[cross_curr])
    converted = bankers_round(foo, 2)
    parent << converted
  end
end

def filter(transactions, sku)
  array = []
  transactions.each do |row|
    if row.include? (sku)
      array << row.last.split
    end
  end
  return array
end