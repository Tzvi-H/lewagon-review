require_relative "customers_view"

class CustomersController
    def initialize(customer_repo)
        @customer_repo = customer_repo
        @customers_view = CustomersView.new
    end

    def add_customer
        name = @customers_view.ask("what is the name of customer?")
        address = @customers_view.ask("what is the address of customer?")

        @customer_repo.create(name, address)

        @customers_view.display("successfully added!")
        list_customers
    end

    def list_customers
        @customers_view.display_customers(@customer_repo.all)
    end

end