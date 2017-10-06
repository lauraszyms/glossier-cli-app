require 'pry'

class Glossier::CLI

  def call
    puts "Glossier - A Beauty Brand Inspired by Real Life."
    list_catagories
    main_menu
    goodbye
  end

  def list_catagories
    Glossier::Catagory.list
  end

  def main_menu
    puts "Enter the number of the catagory you would like to explore, or type exit."
    catagory_choice = nil
    while catagory_choice != "exit"
       catagory_choice = gets.chomp.downcase
      if catagory_choice.to_i > 0
       Glossier::Catagory.product_list(Glossier::Catagory.all[catagory_choice.to_i - 1])
       puts "Enter the number of the product you would like to explore, or type exit."
       product_choice = gets.chomp
       catagory_menu
      end
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
      puts "product info"
    menu_reset
  end



end
