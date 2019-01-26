# LESSON: Keyword arguments
# There are a few problems with this:
#
# The caller has to remember the order of the arguments
# When reading the call, there's no way to tell which argument is which
# The caller must provide values for all arguments, even for the "standard" way of doing things (i.e. no extra shots)
# All of these put the onus on the caller to do things right, which is just asking for trouble. A well-written method is easy to use right and hard to use wrong - by that standard, this is not good code.
#
# Extra reference:
# https://robots.thoughtbot.com/ruby-2-keyword-arguments
#
#############################################################
# GOOD
#############################################################
#
# Define the method
def coffee_price(type, size, extra_shots: 0, cold: false)
  # You can use both positional arguments and keyword arguments in the same sig
  # Positional arguments must come first, and they are required
  # Keyword arguments come with a default values
  # Keyword arguments are optional
  # Keyword arguments can be passed in any Order
  # Find the base price for this drink
  case type
  when :drip
    price = 1.5
  when :latte
    price = 3.7
  when :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify for size
  case size
  when :tall
    # No change
  when :grande
    price *= 1.3
  when :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
    return
  end

  # Charge for extra shots
  price += extra_shots * 0.5

  # Charge for a cold drink
  if cold
    price += 1
  end

  return price
end
# Price for a venti latte with 3 extra shots
p coffee_price(:latte, :venti, extra_shots: 3, cold: false)

# Price for a tall iced drip
p coffee_price(:drip, :tall, cold: true)

# Price for a grande cappuccino
p coffee_price(:cappuccino, :grande)


##############################################################
# BAD
###############################################################
  def bad_coffee_price(type, size, extra_shots, cold)
  # Find the base price for this drink
  case type
  when :drip
    price = 1.5
  when :latte
    price = 3.7
  when :cappuccino
    price = 3.2
  else
    puts "Invalid coffee type: #{type}"
    return
  end

  # Modify for size
  case size
  when :tall
    # No change
  when :grande
    price *= 1.3
  when :venti
    price *= 1.6
  else
    puts "Invalid size: #{size}"
    return
  end

  # Charge for extra shots
  price += extra_shots * 0.5

  # Charge for a cold drink
  if cold
    price += 1
  end

  return price
end

# Price a venti hot latte with 3 extra shots
p bad_coffee_price(:latte, :venti, 3, false)

# Price a tall iced drip
p bad_coffee_price(:drip, :tall, 0, true)
