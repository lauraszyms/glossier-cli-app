require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Scraper

  # def scrape_data
  #   scrape_catagory_list
  # end

  def scrape_catagory_list
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      catagory_url = "https://www.glossier.com/category/#{catagory}"
      Glossier::Catagory.new(catagory, catagory_url)
      # puts "#{index + 1}. #{catagory.capitalize}"
   end
  end


  def self.scrape_product_url(catagory)
    html = open("#{catagory.url}")
    doc = Nokogiri::HTML(html)
    #product_name = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
    product_url = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
    # product_name.each do |name|
    product_url.each do |url|
    scrape_product_attributes(catagory.name, catagory.url)
    # puts "#{index + 1}. #{product_hash[:name]}"
    end
  end

  def self.scrape_product_attributes(catagory, product_url)
    html = open("#{product_url}")
    doc = Nokogiri::HTML(html)
    product_attributes = {
      :name => doc.css('h1').text,
      :catagory => catagory,
      :description => doc.css('.h-desc').search('p').text,
      :price => "price",
      :url => "#{product_url}"
    }
    Glossier::Product.new(product_attributes)
    # puts "#{product[:name]}"
    # puts "#{product[:description]}"
    # puts "#{product[:price]}"
    # puts "#{product[:url]}"
  end


end
