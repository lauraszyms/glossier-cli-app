class Glossier::Product
  attr_accessor :name, :description, :price, :url, :catagory

  def initialize

  end

  def product_attributes
   product_attributes = {
     :name => "Boy Brow",
     :description => "All brow needs have been considered to create THE brow product: one to thicken, fill in, and groom brows into place. The creamy wax formula is inspired by traditional hair pomade for soft, flexible hold that doesn’t stiffen or flake. Comes in four shades: Blond, Brown, and Black boost brows with an oomph of color, while Clear gives you the same soft, conditioning hold minus the pigment. We’re inspired by healthy, face-framing brows and consider brow grooming the last crucial step to heading out into the world: brush your teeth, brush your brows, and then maybe brush your hair.",
     :price => "$16",
     :url => "https://www.glossier.com/products/boy-brow",
     :catagory => Glossier::Catagory.catagory_1
   }

  end

end
