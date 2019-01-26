# csv-pronto.rb
# The CSV Class
require "csv"
require "awesome_print"
require "pry"


# Challenge Write a method to find all the planets with a smaller mass than earth (1.0).

data = CSV.read("../data/planets.csv", headers:true)
smaller_than_earth = data.select{|h| h["mass"].to_i < 1}
smaller_than_earth = smaller_than_earth.map{|h| h["name"]}

p arr = data.map{|row|row.to_h}
arr.each {|hash| p hash.class}




#
