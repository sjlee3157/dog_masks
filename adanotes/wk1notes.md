Command line tutorial: https://hellowebbooks.com/learn-command-line/#cmd-tut
Command line on Code Academy (recommendation from Liz)

# Order of Operations
| symbol(s)      | description(s)                |
| -------------- | ----------------------------- |
| !, unary +     | 1) not, unary plus            |
| **             | 2) exponent                   |
| unary -        | 3) unary minus                |
| *, /, %        | 4) times > divide > mod       |
| +, -           | 5) plus, minus                |
| >, >=, <, <=   | 6) grt > grteq > ls > lseq    |
| <=>, ==, ===   | 7) comp > iseq > ?            |
| &&             | 8) and (intersection)         |
| &#124;&#124;   | 9) or (union)                 |

> a1 & a2 = intersection
a1 | a2 = union

# Data transformations!!
```
symbols = [:a, :b, :c, :d]
numbers = [1, 2, 3, 4]

hash = Hash.new
symbols.each do |symbol|
  hash[symbol] = numbers.shift
end
print hash
```

# Questions

1. How would I use select! ("select-bang") in random-menu.rb?

# Notes
- `allergens = ballergens.uniq!`
- Take input as array.
- `eval` takes any string and runs it at Ruby code. dangerous.

### Scope, local variables, and constants
- local_variables_are_in_snake_case
- CONSTANTS_ARE_IN_SCREAMING_SNAKE_CASE

### Characteristics of a local variable
https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/scope.md

- Local variables start with a lowercase letter or an underscore, no digits
- Local variables are only available within the block in which they were declared
- Local variables will raise an error if they are read before they are created
- Local variables are used often
- Ruby style recommends variable names are in snake_case

### Here are some following rules of constants:
https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/01-ruby-fundamentals/constants.md

- Constants are all uppercase with using underscores to separate words
- Constants are available within the scope of their initialization
- Constants will raise an error if they are read before they're created
- Constants can not be defined inside of methods
- Constants are like any other variables, except that their value must remain constant for the duration of the program
- In Ruby, constants will raise a warning if re-assigned

### Jackie's Regexp
```
\A[+-]?\d*\.{1}\d+\Z # float
\A[+-]?\d+\Z # integer
```

### COMPLEX CONDITIONALS
```
trigger_value = 7
output_string = ""

output_string = case trigger_value
  when 1 then "First number"
  when 7 then "Lucky number"
  else
    output_string = "Something else"
end

puts output_string
```

### Methods

- `puts` is a method! Methods can be attached to an object (`.method`), or freestanding (`puts`)
- `def` is the method signature.

### Weird thing about iteration variables:
```
b="what"

array = [{"key1"=> "value1", "key2" => "value2"}, {"key1"=>"value3", "key2" => "value4"}]
array.each do |a,b|
  #b = "what"
  a[b] = "new"
end
```

### Chris' example:

```
def rating_average(restaurant_array)
  sum = 0
  count = 0
  restaurant_array.each do |k|
    sum = sum + k[:price]
    count += 1
  end
  return sum.to_f / count
end
array = [{price: 24, name: "dominos"},{price: 14, name: "papa john's"}]
rating_average(array)
print array
# [{"key1"=>"value1", "key2"=>"value2", nil=>"new"}, {"key1"=>"value3", "key2"=>"value4", nil=>"new"}]
```

# Complex conditionals
We can trim long complex conditionals like `if/elsif/else/end` with `case variable`:
The `else` is a default.
```
command = gets.chomp
case command
  when "add", "+"
    puts "We're adding numbers"
  when "subtract", "-"
    puts "We're subtracting numbers"
  when "multiply", "*"
    puts "We're multiplying numbers"
  when "divide", "/"
    puts "We're dividing numbers"
  when "exponify", "**"
    puts "We're exponentiating numbers"
  when "sqrt"
    puts "We're finding the square root of a number"
  else
    puts "What do you want from me?!"
end
```

# Regexp
```
r = /^\d{0,}(\.\d{0,2})?$/
until my_money.match r

if (h.each_value.any? (/\D+/)) || (h.each_value.any? (""))
  indicator = 1

  print "Hey chef! How many dishes are on the menu today? > "
  n = gets.chomp
  while n =~ /\D/ || n == ""
    print "No, chef! Try again! > "
    n = gets.chomp
  end
  n = n.to_i
```

"8s" to_f

# Data validation for integers!
```
def error_num(num)
	while num!= num.to_f.to_s && num != num.to_i.to_s
		print "invalid"
		num = gets.chomp
	end
	return num
end

if num.to_i == num
	return num.to_i
else
	return num
```
