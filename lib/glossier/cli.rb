require 'pry'
require 'colorize'

class Glossier::CLI

  def run
    puts "Glossier - A Beauty Brand Inspired by Real Life.".colorize(:light_magenta)
    Glossier::Scraper.new.scrape_data
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
       Glossier::Catagory.all[catagory_choice.to_i - 1].list_products
       puts "Enter the number of the product you would like to explore, or type exit."
       product_choice = gets.chomp
       Glossier::Catagory.all[catagory_choice.to_i - 1].list_products[product_choice.to_i - 1].list_attributes
      menu_reset
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
       self.goodbye
        end
      end
   end

  def goodbye
    puts "Thanks for checking out Glossier - Skin first. Makeup second.".colorize(:light_magenta)
    exit
  end






end
