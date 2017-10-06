require 'open-uri'
require 'pry'


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
    catagory_1 = self.new
    catagory_1.name = "Skincare"
    catagory_1.url = "https://www.glossier.com/category/skincare"
    catagory_1.products = [{:name => "Priming Moisturizer", :description => "Moisturizer"}, {:name => "Super Pure", :description => "serum"}]

    catagory_2 = self.new
    catagory_2.name = "Makeup"
    catagory_2.url = "https://www.glossier.com/category/makeup"
    catagory_2.products = {:name => "Boy brow", :description => "eyebrow"}

    catagory_3 = self.new
    catagory_3.name = "Body"
    catagory_3.url = "https://www.glossier.com/category/body"
    catagory_2.products = {:name => "Body Lotion", :description => "Lotion"}
    [catagory_1, catagory_2, catagory_3]

  end



end
