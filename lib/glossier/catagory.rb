class Glossier::Catagory
 attr_accessor :name, :url
  @@all

  def initialize
  end

  def self.all
    catagory_1 = self.new
    catagory_1.name = "Skincare"
    catagory_1.url = "https://www.glossier.com/category/skincare"

    catagory_2 = self.new
    catagory_2.name = "Makeup"
    catagory_2.url = "https://www.glossier.com/category/makeup"

    catagory_3 = self.new
    catagory_3.name = "Body"
    catagory_3.url = "https://www.glossier.com/category/body"
    [catagory_1, catagory_2, catagory_3]
  end



end
