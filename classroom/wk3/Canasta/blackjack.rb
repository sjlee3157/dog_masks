# blackjack.rb
module Blackjack
  class Card
    attr_reader :max_value
    def initialize
      @max_value = 11   # Aces are worth 11
    end
  end
end
