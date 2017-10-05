class Glossier::CLI

  def call
    puts "Glossier - A Beauty Brand Inspired by Real Life"
    list_catagories
  end

  def list_catagories
    puts "1. Skincare"
    puts "2. Makeup"
    puts "3. Body"
  end

end
