require 'pry'

class Glossier::CLI

  def call
    puts "Glossier - A Beauty Brand Inspired by Real Life."
    list_catagories
    main_menu
    goodbye
  end

  def list_catagories
    Glossier::Catagory.all.each_with_index do |catagory, index|
      puts "#{index + 1}. #{catagory.name}"
    end
    @catagory = Glossier::Catagory.all
  end

  def main_menu
    puts "Enter the number of the catagory you would like to explore, or type exit."
    input = nil
    while input != "exit"
       input = gets.chomp.downcase
      if input.to_i > 0
       @catagory[input.to_i - 1]
      end
    end
  end

  def menu_reset
    puts "Would you like to continue to explore, y or n?"
    input = gets.chomp.downcase
      if input == "y"
       call
      elsif input == "n"
       goodbye
      end
   end

  def goodbye
    puts "Thanks for checking out Glossier - Skin first. Makeup second."
  end

  def list_skincare
    puts "1. Milky Jelly Cleanser"
    puts "2. Priming Moisturizer"
    catagory_menu
  end

  def list_makeup
    puts "1. Haloscope"
    puts "2. Boybrow"
    catagory_menu
  end

  def list_body
    puts "1. Body Hero Wash"
    puts "2. Body Hero Lotion"
    catagory_menu
  end

  def catagory_menu
    puts "Enter the number of the product you would like to explore, or type exit."
    input = nil
    while input != "exit"
      input = gets.chomp
      if input == "1"
       puts "Product 1 info, price, url"
      elsif input == "2"
        puts "Product 1 info, price, url"
      end
      menu_reset
    end
  end



end
