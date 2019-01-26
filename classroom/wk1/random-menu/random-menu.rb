# random menu
# https://github.com/Ada-C10/random-menu

puts ":" * 45, "\n"
puts "Chef Hi!" , "\n"

array1 = "frozen, super-spicy, questionable, day-old, discount, triple-layer, grandma's, sludgy, miniature, cream-filled"
array2 = "pickled, birthday, special, rainbow, caffeinated, fried, home-brewed, non-organic, smoky, cheesy"
array3 = "caviar bites, whipped cream, sports drink, celery juice, vitamins, beans, spinach, cake, tuna, frittata"

array1 = array1.split(", ")
array2 = array2.split(", ")
array3 = array3.split(", ")

print "Hey chef! How many dishes are on the menu today? > "
n = gets.chomp
while n =~ /\D/ || n == ""
  print "No, chef! Try again! > "
  n = gets.chomp
end

n = n.to_i

if n > array1.size
  n = array1.size
  puts "That's a tall order, chef. Let's cap it at #{n} dishes today. Let's see what's cookin."
else
  puts "Roger that, chef. Let's see what's cookin."
end

sleep(1)
puts "\n", "Today's Secret Menu" , "\n"

array1 = array1.sample(n)
array2 = array2.sample(n)
array3 = array3.sample(n)

(0...n).each do |i|
  new_word = "#{array1[i].capitalize} #{array2[i]} #{array3[i]}"
  number = i + 1
  printf("%-4s%-40s\n", number, new_word)
end

puts "\n", ":" * 45, "\n"
