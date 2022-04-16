require_relative "router"
require_relative "meals_controller"
require_relative "meal_repository"
require_relative "customers_controller"
require_relative "customer_repository"

meals_controller = MealsController.new(MealRepository.new("data/meals.csv"))
customers_controller = CustomersController.new(CustomerRepository.new("data/customers.csv"))

router = Router.new(meals_controller, customers_controller)
router.run