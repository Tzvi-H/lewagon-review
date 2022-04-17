class Order
  attr_reader :id, :meal, :customer, :employee, :is_delivered
  def initialize(id, meal, customer, employee, is_delivered)
      @id = id
      @meal = meal
      @customer = customer 
      @employee = employee
      @is_delivered = is_delivered
  end

  def mark_as_delivered
    @is_delivered = true
  end
  
end

