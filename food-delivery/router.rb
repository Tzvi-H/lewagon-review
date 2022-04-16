class Router
    def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
        @meals_controller = meals_controller
        @customers_controller = customers_controller
        @sessions_controller = sessions_controller
        @orders_controller = orders_controller
    end

    def run
        user = @sessions_controller.login
        if user.is_manager
          display_manager_actions
          choice = gets.chomp.to_i
          dispatch_mangager_action(choice)
        else
          # display actions for rider...
        end
    end

    def display_manager_actions
        puts "*:*:*--Welcome to food delivery app--*:*:*" 
        puts "1. add a new meal"
        puts "2. list all meals"
        puts "3. add a new customer"
        puts "4. list all customers"
        puts "5. add a new order"
        puts "6. list all undelivered orders"
    end

    def dispatch_mangager_action(choice)
        case choice
        when 1 then @meals_controller.add_meal
        when 2 then @meals_controller.list_meals
        when 3 then @customers_controller.add_customer
        when 4 then @customers_controller.list_customers
        when 5 then @orders_controller.add_order
        when 6 then @orders_controller.list_undelivered_orders
        end
    end
end