class Router
    def initialize(meals_controller, customers_controller)
        @meals_controller = meals_controller
        @customers_controller = customers_controller
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
        puts "3. add a new customer"
        puts "4. list all customers"
    end

    def dispatch(choice)
        case choice
        when 1 then @meals_controller.add_meal
        when 2 then @meals_controller.list_meals
        when 3 then @customers_controller.add_customer
        when 4 then @customers_controller.list_customers
        end
    end
end
