class OrdersView
  def ask(question)
    puts question
    gets.chomp
  end

  def display_message(message)
    puts message
  end

  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index+1}. #{order.meal.name} - #{order.customer.address} - #{order.employee.username} - delivered [#{order
      .is_delivered}]"
    end
  end

  def display_meals(meals)
      meals.each_with_index do |meal, index|
          puts "#{index+1}. #{meal.name} - $#{meal.price}"
      end
  end

  def display_customers(customers)
      customers.each_with_index do |customer, index|
        puts "#{index+1}. #{customer.name} - #{customer.address}"
      end
  end

  def display_employees(employees)
    riders = employees.filter { |employee| !employee.is_manager }
    
    riders.each_with_index do |rider, index|
      puts "#{index+1}. #{rider.username}"
    end
end
end