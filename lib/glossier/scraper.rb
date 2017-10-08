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

  # def scrape_product_list(catagory)
  #   html = open("#{catagory.url}")
  #   doc = Nokogiri::HTML(html)
  #   product_name = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
  # end

  def self.scrape_product_list(catagory)
    html = open("#{catagory.url}")
    doc = Nokogiri::HTML(html)
    name_list = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
    name_list.each_with_index do |name, index|
      puts "#{index + 1}. #{name}"
    end
  end


  def self.scrape_product_url(catagory, product_choice)
    html = open("#{catagory.url}")
    doc = Nokogiri::HTML(html)
    url_list = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
    self.scrape_product_attributes(url_list[product_choice])
  end

  def self.scrape_product_attributes(product_url)
    html = open("https://www.glossier.com#{product_url}")
    doc = Nokogiri::HTML(html)
    product_attributes = {
      :name => doc.css('h1').text,
      :description => doc.css('.h-desc').search('p').text,
      :price => "price",
      :url => "https://www.glossier.com#{product_url}"
    }
    product = Glossier::Product.new(product_attributes)
    Glossier::Product(product)
  end


end
