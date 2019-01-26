# pet_spec.rb

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'awesome_print'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

module AdaPets
  class Pet
    attr_reader :name, :person
    def initialize(name)
      @name = name
    end
    def set_person(person)
      @person = person
    end
  end
  class Person
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end
end

describe "Pet & Person" do
  let (:pet) { puts "First LET"
    AdaPets::Pet.new("Fido") }
  let (:person) { puts "Second LET"
    AdaPets::Person.new("Ada Lovelace") }

  describe "pet and person for Pet class" do

    it "has a name" do
      expect(pet.name).must_equal "Fido"
    end

    it "sets the pet's person" do
      pet.set_person(person)
      expect(pet.person).must_be_instance_of AdaPets::Person
      expect(pet.person.name).must_be_instance_of String
    end

    it "sets the pet's person's name" do
      pet.set_person(person)
      expect(pet.person.name).must_equal "Ada Lovelace"
    end

  end
end
