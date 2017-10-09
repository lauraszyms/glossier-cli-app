require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Product
  attr_accessor :name, :catagory, :description, :price, :url

  @@all = []

  # def initialize(product_attributes)
  #   @name = student_hash.values_at(:name).join
  #   @catagory = student_hash.values_at(:catagory).join
  #   @description = student_hash.values_at(:description).join
  #   @price = student_hash.values_at(:price).join
  #   @url = student_hash.values_at(:url).join
  #   @@all << self
  # end

  def initialize(attributes)
      attributes.each do |key, value|
        self.send("#{key}=", value)
        @@all << self
    end
  end

  def self.all
    @@all
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
