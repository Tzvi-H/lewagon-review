class Employee
  attr_reader :id, :username, :password, :is_manager

  def initialize(id, username, password, is_manager)
    @id = id
    @username = username
    @password = password
    @is_manager = is_manager
  end
end