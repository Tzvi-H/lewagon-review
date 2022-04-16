require_relative "order"
require_relative "meal_repository"
require_relative "customer_repository"
require_relative "employee_repository"

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []

    load_csv
    
    @next_id = @orders.empty? ? 1 : @orders.last.id.to_i + 1
  end

  def create(meal, customer, employee, is_delivered)
    new_order = Order.new(@next_id, meal, customer, employee, is_delivered)
    
    @next_id += 1

    @orders << new_order

    CSV.open(@orders_csv_path, "ab") do |csv|
      csv << [new_order.id, new_order.is_delivered, new_order.meal.id, new_order.customer.id, new_order.employee.id]
    end
  end

  def undelivered_orders
    @orders.filter { |order| !order.is_delivered }
  end

  private

  def load_csv
    CSV.foreach(@orders_csv_path, headers: :first_row) do |row|
      id = row['id']
      meal = @meal_repository.find_by_id(row['meal_id'])
      customer = @customer_repository.find_by_id(row['customer_id'])
      employee = @employee_repository.find_by_id(row['employee_id'])
      is_delivered = row['delivered'] == 'true'

      @orders << Order.new(id, meal, customer, employee, is_delivered)
    end
  end
end