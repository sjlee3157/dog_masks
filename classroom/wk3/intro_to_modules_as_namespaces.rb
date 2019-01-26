# Additional Resources:
# https://rubymonk.com/learning/books/1-ruby-primer/chapters/35-modules/lessons/80-modules-as-namespaces
# http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html

def outside_method(monkey)
  puts "OUTSIDE #{monkey} METHOD!"
end

module Debug
  def who_am_i
    "#{self.type} #{self.sheets} #{self.price}"
  end
  def me
    puts "me"
  end
end

module Canasta
  outside_method("monkey") # OUTSIDE monkey METHOD!

  class Card
    attr_reader :max_value
    def initialize
      @max_value = 50
    end
  end

  puts self::Card.new.max_value # 50
  puts Canasta::Card.new.max_value # 50

  # nothing in CraftStore can be accessed inside Canasta because it's
  # below Canasta in the file
  # I think this is where mixins are necessary?
# silly_string = CraftStore::String.new
end



module CraftStore

  class StickerPack
    include Debug
    include Comparable
    attr_reader :type, :sheets, :price
    def initialize(type, sheets, price)
      @type = type
      @sheets = sheets
      @price = price
    end
    def summary
      return self.to_s
    end
    def <=>(other)
      self.price <=> other.price
    end
  end

  module Blackjack
    class Card
      attr_reader :max_value
      def initialize
        @max_value = 11
      end
    end
  end
  def self.method(hello) # why? MAKES IT PUBLIC
    puts "#{hello}, wrodl!"
  end
  class String
    attr_accessor :color, :quantity
    def initialize(color, quantity)
      @color = color
      @quantity = quantity
    end
  end
  def another_method
    puts "Hi"
  end

# this method call WILL be executed if the file is executed
  CraftStore.method("sup") # "sup, wrodl!"

# this method call will ONLY be excuted upon file execution IF
# the module Canasta is located ABOVE the module CraftStore  in the file
  puts Canasta::Card.new.max_value # 50

# if a Class is inside a module, it's FOREVER necessary to locate it
# as being in the method, because otherwise, it's ruby's String!
  sillier_string_color = CraftStore::String.new("sillier string color", 666).color
  outside_method(sillier_string_color) # OUTSIDE sillier string color METHOD!

  # bottom_outside_method # NameError: undefined something for CraftStore:Module
end

def bottom_outside_method
  puts "I'm down here!"
end

plant_based_string = CraftStore::String.new("green", 100)
string_full_of_letters = String.new("Word words words")

puts plant_based_string.class # CraftStore::String
puts string_full_of_letters.class # String

CraftStore.method("Greetings") # Greetings, wrodl!
plant_based_string.color = "red"
puts plant_based_string.color # red

# Yes, you can nest Modules and chain the calls
puts CraftStore::Blackjack::Card.new.max_value # 11

#CraftStore.another_method # NoMethodError

llama_stickers = CraftStore::StickerPack.new("llama", 3, 1)
puts llama_stickers.summary # <CraftStore::StickerPack:0x00007fd8e1020910>
puts llama_stickers.who_am_i # "llama 3 1"
octocat_stickers = CraftStore::StickerPack.new("octocat", 5, 2.5)

#Debug.me # NoMethodError
llama_stickers.me # me
puts octocat_stickers <=> llama_stickers
