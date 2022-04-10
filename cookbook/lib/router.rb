class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do 
      display_actions
      choice = gets.chomp.to_i
      if choice == 5 
        break
      end

      dispatch(choice)
    end
  end

  def display_actions
    puts
    puts "-- My CookBook --"
    puts "What do you want to do?"
    puts 

    puts "1. List all recipes"
    puts "2. Add a recipe"
    puts "3. Delete a recipe"
    puts "4. Import recipes from the Internet"
    puts "5. Exit"
  end

  def dispatch(choice)
    case choice
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.import
    else
      puts "Please type 1, 2, 3 or 4 :)"
    end
  end
end