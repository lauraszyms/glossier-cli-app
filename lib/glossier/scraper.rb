require 'open-uri'
require 'pry'
require 'nokogiri'

class Glossier::Scraper

  def scrape_data
    scrape_catagories
    scrape_product_urls
  end

  def scrape_catagories
    html = open('https://www.glossier.com/')
    doc = Nokogiri::HTML(html)
    catagories = doc.css('.p-head-nav-el.mobile-nav-icon').text.gsub("\n", "").strip.split
    catagories.delete("Shop")
    catagories.each_with_index do |catagory, index|
      catagory_url = "https://www.glossier.com/category/#{catagory}"
      Glossier::Catagory.new(catagory, catagory_url)
   end
  end

  # def scrape_product_list(catagory)
  #   html = open("#{catagory.url}")
  #   doc = Nokogiri::HTML(html)
  #   product_name = doc.css('.l-el-a').text.gsub("Learn more", "").gsub("$", "\"").gsub!(/\d+/,"").split("\"")
  # end

  def scrape_product_urls
    html = open("https://www.glossier.com/products")
    doc = Nokogiri::HTML(html)
    product_url = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
    product_url.each { |url| scrape_product_attributes(url) }
  end


  # def self.scrape_product_url(catagory, product_choice)
  #   html = open("#{catagory.url}")
  #   doc = Nokogiri::HTML(html)
  #   url_list = doc.xpath('//div[@class="l-el-a"]/a').map { |link| link['href'] }
  #   self.scrape_product_attributes(url_list[product_choice])
  # end

  def scrape_product_attributes(product_url)
    html = open("https://www.glossier.com#{product_url}")
    doc = Nokogiri::HTML(html)
    product_attributes = {
      :name => doc.css('h1').text,
      :catagory => (doc.css('.p-prod-breadcrumb-section').search('a').children.text.gsub("HomeProducts", "")),
      :description => doc.css('.h-desc').search('p').text,
      :price => "price",
      :url => "https://www.glossier.com#{product_url}"
    }
    product = Glossier::Product.new(product_attributes)
  end


end
