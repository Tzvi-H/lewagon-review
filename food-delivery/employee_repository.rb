require "csv"
require_relative "employee"

class EmployeeRepository
  def initialize(filename)
    @filename = filename
    @employees = []

    CSV.foreach(filename, headers: :first_row) do |row|
        @employees << Employee.new(row['id'], row['username'], row['password'], row['is_manager'] == 'true')
    end

    @next_id = @employees.empty? ? 1 : @employees.last.id.to_i + 1
  end

  def all
    @employees
  end

  def find_by_id(id)
    @employees.find {|employee| employee.id == id.to_s}
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end 
end