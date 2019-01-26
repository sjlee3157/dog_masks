# Module MyAwesomeGame

class Game
  def initialize
  end

  def exhibit_a
    # this method gets search query, prints result
    unless ask == :back
      # do something with what ask returns
      # puts something
    end
    if ask == :quit
      return nil
    else
      return :continue
    end
  end

  def exhibit_b
    # just like exhibit_a
    if ask == :quit
      return :quit
    else
      return :continue
    end
  end

  def ask
    # this method does gets.chomp, and validates/reprompts
    # if user types back, returns :back
    # if user types quit, returns :quit
    # returns either either :back or some result
  end
end

###############################################################################

def menu
  # this method does gets.chomp and returns which game exhibit to run
  # returns :exhibit_a, :exhibit_b, or :quit
end

def quit
  puts "goodbye message!"
  exit(0)
end

game = Game.new
what_exhibit_returns = :continue
while what_exhibit_returns == :continue
  what_exhibit_returns = game.send(menu) # returns :continue or :quit
end
quit
