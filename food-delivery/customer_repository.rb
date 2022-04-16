require "csv"
require_relative "customer"

class CustomerRepository
  def initialize(file_name)
    @file_name = file_name
    @customers = []
    load_csv

    @next_id = @customers.empty? ? 1 : @customers.last.id.to_i + 1
  end

  def create(name, address)
    new_customer = Customer.new(@next_id, name, address)
    @customers << new_customer
    
    CSV.open(@file_name, "ab") do |csv|
      csv << [new_customer.id, new_customer.name, new_customer.address]
    end

    @next_id += 1
  end

  def all
    @customers
  end

  def find_by_id(id)
    @customers.find { |c| c.id == id.to_s }
  end

  private

  def load_csv
    CSV.foreach(@file_name, headers: :first_row) do |row|
      @customers << Customer.new(row['id'], row['name'], row['address'])
    end
  end
end
