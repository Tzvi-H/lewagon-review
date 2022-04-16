require_relative "router"
require_relative "meals_controller"
require_relative "meal_repository"

meals_controller = MealsController.new(MealRepository.new("meals.csv"))
router = Router.new(meals_controller)
router.run