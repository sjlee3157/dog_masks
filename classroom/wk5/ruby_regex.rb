phone_numbers = [
  "(206) 555-1234",
  "425-555-9999",
  "406.555.1818",
  "+1 206 555 8888",
  "4255558872",
]

phone_regex = /^.*(\d{3}).*(\d{3}).*(\d{4})$/

phone_numbers.map! do |num|
  groups = num.match(phone_regex)
  puts groups.class
  puts groups
  puts groups[0]
  puts groups[1]
  # puts groups[2]
  # puts groups[3]
  # puts groups[4]
  # puts groups[5]
  puts "\n"
  "(#{groups[1]}) #{groups[2]}-#{groups[3]}"
end

puts "\n"
puts phone_numbers
