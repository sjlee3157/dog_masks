# data-transformations.rb
# https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/exercises/data-transformation-worksheet.md

puts "\n", ":" * 50
puts "\nDATA TRANSFORMATIONS WORKSHEET\n\n"

# Part 1
## Iterating through Arrays

# 1.1 Map array of strings to array of integers
# (what is the length of the string?)
def method1(my_strings)
  puts "1. Map array of strings to array of integers " \
       "(what is the length of the string?)"
  size_of_string = Array.new
  my_strings.each do |string|
    size_of_string << string.size
  end
  return size_of_string
end

# 1.1 with ENUMERABLES .map method
def enums_method1(my_strings)
  my_strings.map {|string| string.size}
end

# 1.1 Let's execute it!
my_strings = ["muffin", "bubble", "crystal ball", "crystal BALD", "(:", "<3"]
print method1(my_strings), "\n"
print enums_method1(my_strings), "\n\n"

###################################################################

# 1.2 Map an array of integers to array of strings
# (is the integer "even" or "odd"?)
def method2(my_nums)
  puts "1.2. Map an array of integers to array of strings " \
       "(is the integer \"even\" or \"odd\"?)"
  even_or_odd = Array.new
  my_nums.each {|number| number % 2 == 0 ? even_or_odd.push("even") : even_or_odd.push("odd")}
  return even_or_odd
end

# 1.2 with ENUMERABLES .map method
def enums_method2(my_nums)
  my_nums.map {|number| number % 2 == 0 ? "even" : "odd" }
end

# Let's execute it!
my_nums = [0, 1, 1, 2, 3, 5]
print method2(my_nums), "\n"
print enums_method2(my_nums), "\n\n"

###################################################################

# 1.3 Truncate array of strings to smaller array
# (include only elements satisfying string.size < 4)
def method3(my_strings)
  puts "1.3 Truncate array of strings to smaller array " \
       "(include only elements satisfying string.size < 4)"
  less_than_four = Array.new
  my_strings.each do |string|
    if string.size < 4
        less_than_four << string
    end
  end
  return less_than_four
end

# 1.3 with ENUMERABLES .select method
def enums_method3(my_strings)
  my_strings.select {|string| string.length < 4}
end

# 1.3 Let's execute it!
my_strings = ["muffin", "bubble", "crystal ball", "crystal BALD", "(:", "<3"]
print method3(my_strings), "\n"
print enums_method3(my_strings), "\n\n"

###################################################################

# 1.4 Reduce array of strings to a single string
# (element that is the longest string)
def method4(my_strings)
  puts "1.4 Reduce array of strings to a single string " \
       "(element that is the longest string)"
  longest_length = 0
  longest_string = ""
  my_strings.each do |string|
    if string.length > longest_length
      longest_length = string.length
      longest_string = string
    end
  end
  return longest_string
end

# 1.4 with ENUMERABLES .reduce method
def enums_method4(my_strings)
  my_strings.reduce {|memo, string| string.length > memo.length ? string : memo }
end

# 1.4 Let's execute it!
my_strings = ["muffin", "bubble", "crystal ball", "crystal BALD", "(:", "<3"]
print method4(my_strings), "\n"
print enums_method4(my_strings), "\n\n"

###################################################################

## Transforming Arrays into Hashes

# 2.1 Expand array into hash with 2 key/value pairs,
# using array values/index as values
def method2_1(names)
  puts "2.1 Expand array into hash with 2 key/value pairs, " \
       "using array values/index as values"
  new_array = Array.new
  names.each_with_index do |string, index|
    hashlet = Hash.new
    hashlet[:name] = string
    hashlet[:id] = index + 1
    new_array << hashlet
  end
  return new_array
end

# 2.1 with ENUMERABLES .zip, .map, and .merge methods
# merges two arrays of hashes:
# a = [{name: "Name"}]
# b = [{id: 0}]
def enums_method2_1(names)
  hashed_names = Array.new(names.length, :name).zip(names).map {|pair| Hash[*pair]}
  ids = Array.new(names.length, :id).zip(1..names.length).map{|pair| Hash[*pair]}
  hashed_names.map {|pair| pair.merge(ids.shift)}
end

# 2.1 Let's execute it!
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']
print method2_1(names), "\n"
print enums_method2_1(names), "\n\n"

###################################################################

# 2.2 Expand two linked arrays into array of hashes with 3 key/value pairs,
# using array values/index as values

def method2_2(names,specialties)
  puts "2.2. Expand two linked arrays into array of hashes with 3 key/value pairs, " \
       "using array values/index as values"
  array = Array.new
  names.each_with_index do |name, index|
    hashlet = Hash.new
    hashlet[:name] = name
    hashlet[:specialty] = specialties[index]
    hashlet[:id] = index + 1
    array << hashlet
  end
  return array
end

# 2.2 with ENUMERABLES .zip, .map, and .merge methods
def enums_method2_2(names,specialties)
  hashed_names = Array.new(names.length, :name).zip(names).map {|pair| Hash[*pair]}
  specialties = Array.new(names.length, :specialty).zip(specialties).map {|pair| Hash[*pair]}
  ids = Array.new(names.length, :id).zip(1..names.length).map{|pair| Hash[*pair]}

  dwarves = hashed_names.map {|dwarf| dwarf.merge(specialties.shift)}
  dwarves = dwarves.map {|dwarf| dwarf.merge(ids.shift)}
end

# 2.2 Let's execute it!
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']
specialties = ['grump', 'smile', 'nap', 'blush', 'sneeze', 'goof', 'contemplate']
print method2_2(names,specialties), "\n"
print enums_method2_2(names,specialties), "\n\n"

###################################################################

# 2.3 Merge two linked arrays into a single array of arrays,
# with inner array containing elements of the same index
def method2_3(names,specialties)
  puts "2.3. Merge two linked arrays into a single array of arrays," \
       "with inner array containing elements of the same index"
  characters = Array.new
  names.each_with_index do |name, index|
    characters << [name, specialties[index]]
  end
  return characters
end


# 2.3 with ENUMERABLES .zip method
def enums_method2_3(names,specialties)
  names.zip(specialties)
end

# 2.3 Let's execute it!
names = ['Grumpy', 'Happy', 'Sleepy', 'Bashful', 'Sneezy', 'Dopey', 'Doc']
specialties = ['grump', 'smile', 'nap', 'blush', 'sneeze', 'goof', 'contemplate']
print method2_3(names,specialties), "\n"
print enums_method2_3(names,specialties), "\n\n"

###################################################################

# More Transformations
# 3.1 Flatten an array of hashes to an array of strings
def method3_1(characters)
  puts "3.1 Flatten an array of hashes to an array of strings"
  array = Array.new
  characters.each do |h,k|
    str = "#{h[:name]}'s specialty is to #{h[:specialty].upcase}"
    array << str
  end
  return array
end

# 3.1 using ENUMERABLES .map method
def enums_method3_1(characters)
  return characters.map { |h,k| "#{h[:name]}'s specialty is to #{h[:specialty].upcase}"}
end

# 3.1 Let's execute it!
characters = [{:name=>"Grumpy", :specialty=>"grump", :id=>1},
 {:name=>"Happy", :specialty=>"smile", :id=>2},
 {:name=>"Sleepy", :specialty=>"nap", :id=>3},
 {:name=>"Bashful", :specialty=>"blush", :id=>4},
 {:name=>"Sneezy", :specialty=>"sneeze", :id=>5},
 {:name=>"Dopey", :specialty=>"goof", :id=>6},
 {:name=>"Doc", :specialty=>"contemplate", :id=>7}]
print method3_1(characters), "\n"
print enums_method3_1(characters), "\n\n"

puts ":" * 50
