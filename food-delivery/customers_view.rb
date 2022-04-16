class CustomersView
  def ask(question)
      puts question
      gets.chomp
  end

  def display(message)
      puts message
  end

  def display_customers(customers)
      customers.each_with_index do |customer, index|
        puts "#{index+1}. #{customer.name} - #{customer.address}"
      end
  end
end