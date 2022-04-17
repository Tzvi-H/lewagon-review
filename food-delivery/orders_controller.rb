require_relative "orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @orders_view = OrdersView.new
  end

  def add_order
    @orders_view.display_meals(@meal_repository.all)
    meal = @meal_repository.find_by_index(@orders_view.ask('which meal? (enter a number)').to_i - 1)

    @orders_view.display_customers(@customer_repository.all)
    customer = @customer_repository.find_by_index(@orders_view.ask('which customer? (enter a number)').to_i - 1)

    @orders_view.display_employees(@employee_repository.all)
    employee = @employee_repository.find_by_username(@orders_view.ask('which employee? (enter a username)'))

    @order_repository.create(meal, customer, employee, false)
    list_undelivered_orders
  end

  def list_undelivered_orders
    @orders_view.display_orders(@order_repository.undelivered_orders)
  end

  def list_undelivered_my_orders(user_id)
    @orders_view.display_orders(@order_repository.undelivered_my_orders(user_id))

  end

  def mark_as_delivered(user_id)
    list_undelivered_my_orders(user_id)
    index = @orders_view.ask("which order did you deliver").to_i - 1
    order = @order_repository.find_undeliverd_my_order_by_index(user_id,index)
    order.mark_as_delivered
    @order_repository.save_csv
    @orders_view.display_message("successfully delivered!") 
    list_undelivered_my_orders(user_id)
  end

end