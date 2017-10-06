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
       @catagory[input.to_i - 1].products.each_with_index do |product, index|
         puts "#{index + 1}. #{product[:name]}"
       end
      end
      catagory_menu
    end
  end

  def menu_reset
    puts "Would you like to continue to explore, y or n?"
    input = gets.chomp.downcase
     while input != "exit"
     if input == "y"
       call
     elsif input == "n"
       goodbye
        end
      end
   end

  def goodbye
    puts "Thanks for checking out Glossier - Skin first. Makeup second."
    exit
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
