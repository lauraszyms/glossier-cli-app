require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Scraper

  def scrape_catagory_list
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      Glossier::Catagory.new(catagory, "https://www.glossier.com/category/#{catagory}")
      # puts "#{index + 1}. #{catagory.capitalize}"
   end
  end


  def scrape_product_list(catagory_name)
    html = open(catagory_name.url)
    doc = Nokogiri::HTML(html)
    product_name = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
    product_url = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
    product_name.each do |name|
    product_url.each do |url|
    Glossier::Product.new(name, url)
    # puts "#{index + 1}. #{product_hash[:name]}"
    end
  end

  def scrape_product_attributes(user_product_hash)
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
