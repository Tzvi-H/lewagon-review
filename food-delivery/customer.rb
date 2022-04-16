class Customer
  attr_reader :id, :name, :address

  def initialize(id, name, address)
    @id = id
    @name = name
    @address = address
  end
end

c = Customer.new(1, 'sunny', 'Zurich')

