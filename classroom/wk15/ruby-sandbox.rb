dont_user_var = "A poorly made variable"
puts dont_user_var

person_age = 55
ada_age = 2

if person_age < ada_age
   print "This person is younger"
elsif ada_age < person_age
   print "Ada is younger"
else
   print "They’re the same!"
end

x = 1
y = 3

if x > y || x == y
   if x > y
      print "x is bigger"
   else
      print "x = y"
   end
else
   print "y is bigger"
end

10.times do |i|
  puts i * i
end

total = 0

(1..3).each do |i|
  total = total + i
end

puts total
