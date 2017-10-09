require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Product
  attr_accessor :name, :catagory, :description, :price, :url

  @@all = []

  def initialize(attributes_hash)
        @name = attributes_hash.values_at(:name).join
        @catagory = attributes_hash.values_at(:catagory).join
        @description = attributes_hash.values_at(:description ).join
        @price = attributes_hash.values_at(:price).join
        @url = attributes_hash.values_at(:url).join
        catagory_check
        add_to_catagory(self)
        self.catagory.add_product(self)
        add_to_all
        add_to_catagory(self)
        self.catagory.add_product(self)

        @@all << self

  end

  def self.all
    @@all
  end

  def clear
    @@all.clear
  end

  def add_to_catagory(product)
    catagory_instance = Glossier::Catagory.find_by_name(product.catagory)
    product.catagory = catagory_instance
  end

  def list_attributes
    puts "#{self.name}"
    puts "#{self.description}"
    puts "#{self.price}"
    puts "#{self.url}"
  end

  def add_to_all
    if self.catagory != "all"
      self.catagory = "all"
    end
  end

  def catagory_check
    if self.catagory == " " || self.catagory == ""
      self.catagory = "all"
    end
  end

    #
  # def self.create(attributes)
  #   new_instance = self.new(name)
  #   @@all << new_instance
  #   new_instance
  # end
  #
  # def self.find_by_name(name)
  #   all.detect { |a| a.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end



end
