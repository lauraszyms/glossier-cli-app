require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Catagory
 attr_accessor :name, :url, :products

   @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @products = []
  end

  def products
    @products
  end

  def add_product(product)
    @products << (product)
  end


  def self.all
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      puts "#{index + 1}. #{catagory.capitalize}"
   end
  end











end
