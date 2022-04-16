require_relative "meals_view"

class MealsController
    def initialize(meal_repo)
        @meal_repo = meal_repo
        @meal_view = MealsView.new

    end

    def add_meal
        name = @meal_view.ask("what is the name of meal?")
        price = @meal_view.ask("what is the price of meal?").to_i

        @meal_repo.create(name, price)
        
        @meal_view.display("successfully added!")
        list_meals
    end

    def list_meals
        @meal_view.display_meals(@meal_repo.all)
    end

end

#add a new meal
#list all meals