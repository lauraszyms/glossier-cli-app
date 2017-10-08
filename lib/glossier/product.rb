require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Product
  attr_accessor :name, :description, :price, :url

  @@all = []

  # def initialize(product_attributes)
  #   @name = student_hash.values_at(:name).join
  #   @catagory = student_hash.values_at(:catagory).join
  #   @description = student_hash.values_at(:description).join
  #   @price = student_hash.values_at(:price).join
  #   @url = student_hash.values_at(:url).join
  #   @@all << self
  # end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    new_instance = self.new(name)
    @@all << new_instance
    new_instance
  end

  def self.find_by_name(name)
    all.detect { |a| a.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def add_attributes(attributes)
    @description = attributes.values_at(:description).join
    @price = attributes.values_at(:price).join
    @url = attributes.values_at(:url).join
  end


end
