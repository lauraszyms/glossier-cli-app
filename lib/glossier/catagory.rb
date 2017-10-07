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

  def self.list
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      @@all << self.new(catagory, "https://www.glossier.com/category/#{catagory}")
      puts "#{index + 1}. #{catagory.capitalize}"
   end
  end


  def self.product_list(catagory_name)
    html = open(catagory_name.url)
    doc = Nokogiri::HTML(html)
    product_name = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
    product_url = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
    product_name.each { |name| catagory_name.products << { :name => name } }
    product_url.each { |url| catagory_name.products.each {|each_hash| each_hash[:url] = url } }
    catagory_name.products.each_with_index do |product_hash, index|
    puts "#{index + 1}. #{product_hash[:name]}"
    end
  end

 def self.products
   @products
 end

  def self.all
    @@all
  end

  def self.product_attributes(user_product_hash)
    html = open("https://www.glossier.com#{user_product_hash[:url]}")
    doc = Nokogiri::HTML(html)
    product = {
      :name => doc.css('h1').text,
      :description => doc.css('.h-desc').search('p').text,
      :price => "price",
      :url => "https://www.glossier.com#{user_product_hash[:url]}"
    }
    puts "#{product[:name]}"
    puts "#{product[:description]}"
    puts "#{product[:price]}"
    puts "#{product[:url]}"
  end











end
