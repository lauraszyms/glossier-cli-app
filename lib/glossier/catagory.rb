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

  def self.product_list(user_catagory)
    html = open("https://www.glossier.com/category/#{user_catagory}")
    doc = Nokogiri::HTML(html)
    @products = doc.css('.pro-list.container').text.strip.split("\"")
    @products.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
   end
  end

  def add_product(product)
    @products << (product)
  end

  def self.all
    @@all
  end


  def self.list
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      @@all << catagory
      puts "#{index + 1}. #{catagory.capitalize}"
   end
  end











end
