# csv_printer.rb
require 'csv'


while true
  puts "What file would you like to print?"
  filename = gets.chomp

  # CSV.read(filename).each do |line|
  #      puts line.join(",")
  #    end


  begin
    CSV.read(filename).each do |line|
      puts line.join(",")
    end
  rescue SystemCallError => exception #a local variable
    #(can name it anything you want! convention is to name it exception)
    puts "Could not open file: #{exception.message}"

  #end
    puts "Would you like to go again?"
    break unless gets.chomp == "yes"
    # if the break is inside the rescue block:
    # it breaks us out of the while loop (innermost loop)
    # because the BEGIN-----RESCUE----END is not a loop.
    # but if the rescue clause isn't invoked, then
    # the loop will never break!
  end
end
