require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Product
  attr_accessor :name, :catagory, :description, :price, :url

  @@all = []

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    @@all << self
    end
  end

  def all
    @@all
  end

  def self.product_list(catagory)
    @@all.each_with_index do |product, index|
      puts "#{index + 1}. #{product[:name]}"
  end

end
