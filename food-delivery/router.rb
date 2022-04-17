class Router
    def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
        @meals_controller = meals_controller
        @customers_controller = customers_controller
        @sessions_controller = sessions_controller
        @orders_controller = orders_controller
        @user = nil
    end

    def run
        @user = @sessions_controller.login

        loop do
            if @user.is_manager
                display_manager_actions
                choice = gets.chomp.to_i
                break if choice == 0 
                dispatch_mangager_action(choice)
            else
                display_rider_actions
                choice = gets.chomp.to_i
                break if choice == 0 
                dispatch_rider_action(choice)      
            end
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
        puts "0. Exit the app"
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

    def display_rider_actions
        puts "*:*:*--Welcome to food delivery app--*:*:*" 
        puts "1. list all my undelivered orders"
        puts "2. mark one of my orders as delivered"
        puts "0. Exit the app"
    end

    def dispatch_rider_action(choice)
        case choice
        when 1 then @orders_controller.list_undelivered_my_orders(@user.id)
        when 2 then @orders_controller.mark_as_delivered(@user.id)
        end
    end
end