class Glossier::CLI

  def call
    puts "Glossier - A Beauty Brand Inspired by Real Life"
    list_catagories
    menu
    goodbye
  end

  def list_catagories
    puts "1. Skincare"
    puts "2. Makeup"
    puts "3. Body"
  end

  def menu
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

end
