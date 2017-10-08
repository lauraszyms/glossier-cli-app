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

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
      @@all << self
    end
  end

  def self.all
    @@all
  end


end
