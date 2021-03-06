

class Glossier::Product
  attr_accessor :name, :catagory, :description, :price, :url

  @@all = []

  def initialize(attributes_hash)
    @name = attributes_hash.values_at(:name).join
    @catagory = attributes_hash.values_at(:catagory).join
    @description = attributes_hash.values_at(:description ).join
    @price = attributes_hash.values_at(:price).join
    @url = attributes_hash.values_at(:url).join
    catagory_check
    add_to_catagory(self)
    self.catagory.add_product(self)
    add_to_all
    add_to_catagory(self)
    self.catagory.add_product(self)

    @@all << self

  end

  def self.all
    @@all
  end

  def clear
    @@all.clear
  end

  def add_to_catagory(product)
    catagory_instance = Glossier::Catagory.find_by_name(product.catagory)
    product.catagory = catagory_instance
  end

  def list_attributes
    puts "#{self.name}".colorize(:light_magenta)
    puts "#{self.description}"
    puts "$#{self.price}".colorize(:light_magenta)
    puts "#{self.url}".colorize(:light_magenta)
  end

  def add_to_all
    if self.catagory != "all"
      self.catagory = "all"
    end
  end

  def catagory_check
    if self.catagory == " " || self.catagory == ""
      self.catagory = "all"
    end
  end



end
