# Week 12
# Tuesday - Consuming an API with Ruby
# https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/09-intermediate-rails/consuming-an-api.md

# require 'httparty'
require 'awesome_print'
#
# response = HTTParty.get('https://dog.ceo/api/breeds/image/random')
# ap response
# puts response.code
# puts response.message
# puts response.body
#
# ap JSON.parse(response.body)["message"]
# # convert from JSON to hash before accessing the key called "message"
#
# puts response.headers["date"]

# require 'httparty' # If using Rails with a Gemfile, this require is not needed
# class Dog
#   attr_accessor :breed
#
#   def initialize(breed)
#     @breed = breed
#   end
#
#   #Using HTTParty to get and parse a JSON request
#   def random_picture
#     # this will ensure that there are no weird characters in the URI (like a space in the breed name)
#     encoded_uri = URI.encode("https://dog.ceo/api/breed/#{ @breed }/images/random")
#     response = HTTParty.get(encoded_uri)
#
#     if response.code != 200
#       puts "Error #{response.code}"
#     end
#
#     picture = response.parsed_response['message']
#     return picture
#   end
# end
#
# myPug = Dog.new('pug')
# puts myPug.random_picture

require 'httparty'
class VolumeSearch

  attr_accessor :search_term

  def initialize(search_term)
    @search_term = search_term
  end

  def search
    encoded_uri = URI.encode("https://www.googleapis.com/books/v1/volumes?q=#{@search_term}")
    response = HTTParty.get(encoded_uri)

    if response.code != 200
      puts "Error #{response.code}"
    end

    return response.parsed_response
  end

  def print_results
    results = self.search
    puts "You searched for: #{@search_term}"
    puts "Top 10 Results (title - subtitle - authors)"
    results["items"].each_with_index do |item, index|

      print index+1, ". ", item["volumeInfo"]["title"], " - ", item["volumeInfo"]["subtitle"], " by ", item["volumeInfo"]["authors"]
      puts "\n"
    end
  end
end

hp = VolumeSearch.new("harry_potter")
hp.print_results
# p hp.search
# ap hp.search_term


# response = HTTParty.get('https://www.googleapis.com/books/v1/volumes?q=harry_potter')
# puts response.code
# puts response.message
# puts response.body
#
# ap JSON.parse(response.body)["message"]
# # convert from JSON to hash before accessing the key called "message"
#
# puts response.headers["date"]
