require 'pry'
class Owner
  #attr_accessor :cat, :dog
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    new_cat.owner = self
    cats << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    new_dog.owner = self
    dogs << new_dog
  end
  
  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end

  def sell_pets
      pets = self.dogs + self.cats
  
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
  end
  
    # dogs.each{|dog| dog.mood = "nervous"}
    # cats.each{|cat| cat.mood = "nervous"}
    # dogs.each{|dog| dog.owner = nil}
    # cats.each{|cat| cat.owner = nil}


  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end




end