class Router
    def initialize(controller)
        @meals_conterller = controller 
    end

    def run 
        display_actions
        choice = gets.chomp.to_i
        dispatch(choice)
    end

    def display_actions
        puts "*:*:*--Welcome to food delivery app--*:*:*" 
        puts "1. add a new meal"
        puts "2. list all meals"
    end

    def dispatch(choice)
        case choice
        when 1 then @meals_conterller.add_meal
        when 2 then @meals_conterller.list_meals
        end
    end
end
