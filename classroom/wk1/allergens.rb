menu = [
  {
    name: 'beet salad',
    price: 6.75,
    allergens: ['nuts']
  },
  {
    name: 'quiche',
    price: 10.00,
    allergens: ['gluten', 'dairy', "soy"]
  },
  {
    name: 'molten chocolate cake',
    price: 8.50,
    allergens: []
  }
]

meal = Hash.new
meal[:name] = "porcupine stew"
meal[:price] = 9.00
meal[:allergens] = ["soy"]
menu << meal

meal = Hash.new
meal[:name] = "dirty old rag"
meal[:price] = 2.75
meal[:allergens] = ["rag", "dirt"]
menu << meal

print menu

sum = 0
count = 0
menu.each do |h|
  sum += h[:price]
  count += 1
end

average = sum / count
puts sum
puts count
puts "Average is #{average}"

allergens = []
menu.each do |h|
  h[:allergens].each do |a|
    if !allergens.include? a
      allergens << a
    end
  end
end

hallergens = Hash.new(0)
menu.each do |h|
  h[:allergens].each do |a|
    hallergens[a] += 1
  end
end

ballergens = []
menu.each do |h|
  h[:allergens].each do |a|
    ballergens << a
  end
end
# allergens = ballergens.uniq!

print allergens
print hallergens
print ballergens
puts ballergens.uniq!
