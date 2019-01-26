# canasta.rb
module Canasta
  class Card
    attr_reader :max_value
    def initialize
      @max_value = 50   # Jokers are worth 50 points!
    end
  end
end
