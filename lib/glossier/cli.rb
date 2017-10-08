require 'pry'
require 'colorize'

class Glossier::CLI

  def run
    puts "Glossier - A Beauty Brand Inspired by Real Life.".colorize(:light_magenta).underline
    puts "Loading...".colorize(:blink => :white)
    Glossier::Scraper.new.scrape_catagory_list
    call
  end

  def call
    list_catagories
    main_menu
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
       user_catagory = Glossier::Catagory.all[catagory_choice.to_i - 1]
       Glossier::Scraper.scrape_product_url(user_catagory)
       puts "Enter the number of the product you would like to explore, or type exit."
       product_choice = gets.chomp
       Glossier::Product.product_list
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


  def catagory_menu(user_catagory, product_choice)
    if product_choice > 0
     Glossier::Catagory.product_attributes(user_catagory.products[product_choice - 1])
   end
    menu_reset
  end



end
