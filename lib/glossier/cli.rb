class Glossier::CLI

  def call
    puts "Glossier - A Beauty Brand Inspired by Real Life"
    list_catagories
    main_menu
    goodbye
  end

  def list_catagories
    puts "1. Skincare"
    puts "2. Makeup"
    puts "3. Body"
  end

  def main_menu
    puts "Enter the number of the product catagory you would like to explore, or type exit"
    input = nil
    while input != "exit"
       input = gets.chomp
      if input == "1"
       list_skincare
      elsif input == "2"
        list_makeup
      elsif input == "3"
        list_body
      end
    end
  end

  def goodbye
    puts "Thanks for checking out Glossier - Skin first. Makeup second."
  end

  def list_skincare
    puts "1. Milky Jelly Cleanser"
    puts "2. Priming Moisturizer"
    skincare_menu
  end

  def list_makeup
    puts "1. Haloscope"
    puts "2. Boybrow"
  end

  def list_body
    puts "1. Body Hero Wash"
    puts "2. Body Hero Lotion"
  end

  def skincare_menu
    puts "Enter the number of the product you would like to explore, or type exit"
    input = nil
    while input != "exit"
       input = gets.chomp
      if input == "1"
       puts "Product 1 info, price, url"
      elsif input == "2"
        puts "Product 1 info, price, url"
      end
    end
  end

end
