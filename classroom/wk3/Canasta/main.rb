# main.rb
require_relative 'blackjack'
require_relative 'canasta'

blackjack_card = Blackjack::Card.new
puts blackjack_card.max_value # => 50 (uh oh!)

canasta_card = Canasta::Card.new
puts canasta_card.max_value   # => 50
