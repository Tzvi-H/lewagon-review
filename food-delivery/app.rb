require_relative "router"

require_relative "meal_repository"
require_relative "customer_repository"
require_relative "employee_repository"
require_relative "order_repository"

require_relative "meals_controller"
require_relative "customers_controller"
require_relative "orders_controller"
require_relative "sessions_controller"

meal_repository = MealRepository.new("data/meals.csv")
customer_repository = CustomerRepository.new("data/customers.csv")
employee_repository = EmployeeRepository.new("data/employees.csv")
order_repository = OrderRepository.new('data/orders.csv', meal_repository, customer_repository, employee_repository)

sessions_controller = SessionsController.new(employee_repository)
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run