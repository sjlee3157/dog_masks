# intro_to_classes_and_objects.rb
# Wk 3

# This is a CLASS!
class User
# write/read @name
# write/read @email
# attr_reader + attr_writer = attr_accessor
# def name= (name)
#   @name = name
# end

attr_accessor :email # these are method names
attr_reader :name

# A method to initalize our class!!!
  def initialize(name)
    @name = name
    @email = "#{@name.strip.downcase}@adadev.org"
    @user_name = "#{@name.split(" ").first}"
  end

  def print_user_name
    puts @user_name
  end

  def user_email
    puts @email
  end

  def user_summary
    puts "#{@name} : #{@user_name} : #{@email}"
  end

  def name_change(name)
    @name = name
    self.user_summary
  end

  def is_self_before_alpha(other_user)
    return self.name < other_user.name
  end
end
