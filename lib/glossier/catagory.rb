require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Catagory
 attr_accessor :name, :products

   @@all = []

  def initialize(name)
    @name = name
    @products = []
    @@all << self
  end


   def self.all
     @@all
   end

   def clear
     @@all.clear
   end

   def self.list
     @@all.each_with_index do |catagory, index|
       puts "#{index + 1}. #{catagory.name.capitalize}"
     end
   end

   def add_product(product)
     @products << product
   end

   def self.find_by_name(name)
     all.detect { |a| a.name == name }
   end

   def self.create(name)
     if self.find_by_name = nil
     new_instance = self.new(name)
     @@all << new_instance
     new_instance
    end
   end

   def self.find_by_name(name)
     all.detect { |a| a.name == name }
   end

   def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create(name)
   end

   def list_products
     @products.uniq.each_with_index do |product, index|
       puts "#{index +1}. #{product.name}"
     end
   end


end
