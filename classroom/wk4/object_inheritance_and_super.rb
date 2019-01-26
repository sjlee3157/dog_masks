# https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/02-intermediate-ruby/object-inheritance.md
class Property
  attr_reader :id, :street, :city, :state, :zip

  def initialize(id, street, city, state, zip)
    @id = id
    @street = street
    @city = city
    @state = state
    @zip = zip
  end

  def mailing_address
    return "#{street}\n#{city}, #{state} #{zip}"
  end
end

class House < Property
  attr_reader :availability_start

  def initialize(id, street, city, state, zip, availability_s)
    super(id, street, city, state, zip)
    @availability_start = availability_s
  end

  def when_is_it_ready
    return "House available starting #{availability_start}"
  end

end

# Apartment is-a Property
# Apartment inherits from Property
# "base class" = Property
# "subclass" = Apartment
# this is called "implicit inheritance"
class Apartment < Property
  attr_reader :unit, :availability_start, :availability_end

  def initialize(id, street, unit, city, state, zip, availability_s, availability_e)
    super(id, street, city, state, zip)
    # replicates the Parent class's #initialize
    # super MUST BE ON THE FIRST LINE!!
    @availability_start = availability_s
    @availability_end = availability_e
    @unit = unit
  end

  # this overwrites/overrides the Parent method (Child can always do this)
  # Ruby can dynamically (= at runtime) figure out whether your obj is a
  # Property or an Apartment, and call whichever method is appropriate
  def mailing_address
    return "Unit #{unit}\n#{super.upcase}"
  # super returns a string--Ruby does super FIRST.
  # be careful about what super is returning!!!!!
  # HERE WE USE SUPER TO INVOKE BEHAVIOR IN BASE CLASSES
  # (IN THE OVERRIDING METHOD)
  end

  def when_is_it_ready
    return "you can rent from #{availability_start} until #{availability_end}."
  end
end

class DevinsApartment < Apartment
end

# generic_property = Property.new(12345, '123 St Charles Place', 'New York', 'NY', 12080)
# puts generic_property.mailing_address #=> "123 St Charles Place"
#                                   #  "New York, NY 12080"
#
fun_place = Apartment.new(56789, '111 Boardwalk', "#A3", 'New York', 'NY', 12070, "Aug 01", "Sept 01")
puts fun_place.mailing_address #=> "111 Boardwalk"
                          #   "New York, NY 12070"
puts fun_place.when_is_it_ready

array_of_props = [Property.new(12345, '123 St Charles Place', 'New York', 'NY', 12080),
                  Apartment.new(56789, '111 Boardwalk', "#A3", 'New York', 'NY', 12070, "Aug 01", "Sept 01"),
                  Property.new(12345, '123 St Charles Place', 'New York', 'NY', 12080),
                  DevinsApartment.new(56789, '111 Boardwalk', "#A3", 'New York', 'NY', 12070, "Aug 01", "Sept 01")
                 ]

devins_childhood_home = House.new(56789, '111 Boardwalk', 'New York', 'NY', 12070, "Aug 01")
devins_childhood_home.when_is_it_ready

array_of_props.each_with_index do |prop, index|
  puts "#{index+1}. #{prop.mailing_address}"
  puts "\n"
end
