# calculator.rb
# https://www.google.com/url?q=https%3A%2F%2Fgithub.com%2FAda-C10%2Fcalculator&sa=D&usd=2&usg=AFQjCNF8YsY1ij6pguWOvbMUgTJO86XQ7Q

$known_adds = ["+", "add", "plus"]
$known_mins = ["-", "sub", "minus"]
$known_mults = ["x", "*", "times", "mult"]
$known_divs = ["/", "÷", "div", "divided by"]
$known_mods = ["%", "mod", "modulo", "remainder"]
$known_powers = ["^", "**", "power", "to the power of"]
$known_operations = $known_adds + $known_mins + $known_mults + $known_divs + $known_mods + $known_powers

def header
  puts ":" * 50, "\n", "CALCULATOR!", "\n"
  puts "[Number 1] [Operation] [Number 2] = _______", "\n"
  puts "You can type any of these operations:"
  puts $known_adds.join("\t")
  puts $known_mins.join("\t")
  puts $known_mults.join("\t")
  puts $known_divs.join("\t")
  puts $known_mods.join("\t")
  puts $known_powers.join("\t")
  puts "\n"
end

def footer
  puts "\n", ":" * 50, "\n"
end

def add(a,b)
  $operator_symbol = "+"
  $result = a+b
end

def subtract(a,b)
  $operator_symbol = "-"
  $result = a-b
end

def multiply(a,b)
  $operator_symbol = "x"
  $result = a*b
end

def divide(a,b)
  $operator_symbol = "÷"
  if b == 0.0
    $result = nil
  else
    $result = a/b
  end
end

def remainder(a,b)
  $operator_symbol = "%"
  if b == 0.0
    $result = nil
  else
    $result = (a%b).to_i
  end
end

def exponify(a,b)
  $operator_symbol = "^"
  $result = (a**b)
end

def reset_errors_hash
  $errors_hash = Hash.new
end

def check_number(label)
  print "Number #{label}\t"
  number = gets.chomp
  allowed_number = /\A-{0,1}\d{0,}(\.\d{0,})?\z/
  if number !~ allowed_number || number == ""
      $errors_hash["Number #{label}"] = 1
  else number = number.to_f
  end
  return number
end

def get_math
  reset_errors_hash

  $num1 = check_number(1)

  print "Operation\t"
  $operation = gets.chomp
  unless $known_operations.include?($operation)
      $errors_hash["THE OPERATION"] = 1
  end

  $num2 = check_number(2)
end

def check_math
  while $errors_hash.has_value?(1)
    puts "\n", "Oops, try again. I can't accept your input for: #{$errors_hash.keys.join("; ")}.", "\n"
    get_math
  end
end

def do_math(a,b)
  case
    when $known_adds.include?($operation)
      add(a,b)
    when $known_mins.include?($operation)
      subtract(a,b)
    when $known_mults.include?($operation)
      multiply(a,b)
    when $known_divs.include?($operation)
      divide(a,b)
    when $known_mods.include?($operation)
      remainder(a,b)
    when $known_powers.include?($operation)
      exponify(a,b)
    else
      quit("case $operation")
  end
  return $result
end

def print_math(a,b,c,d)
  if ( c == "÷" || c == "%" ) && b == 0.0
    puts "\t\tCan't divide by zero! [nil]"
  else
    puts "Expression\t#{a} #{c} #{b} = #{$result.round(d)}\t\t(Rounded to up to #{d} decimal places.)"
  end
end

def quit(why)
  puts "Quitting. Something unexpected happened in: #{why}."
  exit
end

# here's the program running

header
get_math
check_math
do_math($num1,$num2)
print_math($num1,$num2,$operator_symbol,5)
footer

# To do:
# put arrays in an array of hashes
# do I really need all of the dollar signs?
# parentheticals? refactor without asking 3 times. input expression. remove whitespace. split string by a known operator. string 1 = num1, operator = operator, string 2 = num2.
# square root
# repeat unless type quit to quit
