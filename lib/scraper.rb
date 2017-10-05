require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_home_page(www.glossier.com)
     doc = Nokogiri::HTML(open(www.glossier.com))
     catagory_array = [
       :skincare => ""
       :makeup => ""
       :body => ""
     ]
  end


end
