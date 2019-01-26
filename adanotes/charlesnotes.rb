require "pry"
require "awesome_print"
require "minitest/spec"
require "minitest/autorun"  # need this if i'm not using the whole suite
require "minitest/skip_dsl"

PETS_IN_SPACE = [
  {
    name: 'beet salad',
    age: 9,
    food: ['nuts'],
    species: :cat,
  },
  {
    name: 'quiche',
    age: 10,
    food: ['gluten', 'dairy', "soy"],
    species: :dog,
  },
  {
    name: 'molten chocolate cake',
    age: 8,
    food: nil,
    species: :iguana,
  }
]

PETS_IN_SPACE2 = [
  {
    name: 'beet salad',
    age: 9,
    food: ['nuts'],
    species: :cat,
  },
  {
    name: 'quiche',
    age: 10,
    food: ['gluten', 'dairy', "soy"],
    species: :dog,
  },
  {
    name: 'molten chocolate cake',
    age: 8,
    food: [],
    species: :iguana,
  }
]

PETS_IN_SPACE3 = [
  {
    name: 'beet salad',
    age: 9,
    food: ['nuts'],
    species: :cat,
  },
  {
    name: 'quiche',
    age: 10,
    food: ['gluten', 'dairy', "soy"],
    species: :dog,
  },
  {
    name: 'molten chocolate cake',
    age: 8,
    food: ["dirty", "old", "rags"],
    species: :iguana,
  }
]

def average_age(pets)
  # count
  # sum
##########################################
# reduce isn't the best because it's multiple to multiple!
# sum = pets.reduce(0){|sum,h| sum + h[:age]}
# average_age = sum/ pets.size
###########################################
# 1. find age of each pet => array of ages
  # sum => integer
  total_age = pets.map { |h| h[:age] }.sum
  average_age = total_age / pets.size
end

def all_foods?(pets)
  raise NoMethodError if pets.any?{|h| h[:food] == nil}
  if pets.any?{ |h| h[:food].size < 1 }
    return false
  else
    return true
  end
end

describe :average_age do
  it "will calculate the average correctly" do
    # Arrange
    pets = PETS_IN_SPACE2
    # Act
    result = average_age(pets)
    # Assert
    expect(result).must_equal 9

    expect(average_age(PETS_IN_SPACE)).must_equal 9
  end
end

describe :all_foods? do
  it "will return true or false correctly" do
    expect{all_foods?(PETS_IN_SPACE)}.must_raise NoMethodError

    expect(all_foods?(PETS_IN_SPACE3)).must_equal true
    # Arrange
    pets = PETS_IN_SPACE2
    # Act
    result = all_foods?(pets)
    # Assert
    expect(result).must_equal false
  end
  it "will raise NoMethodError for nil value in [:food] array" do
    # Arrange
    pets = PETS_IN_SPACE
    # EXPLOSION!
    #result = foods?(pets)
    # Act-Assert
    expect{foods?(pets)}.must_raise NoMethodError
  end
end











#
