require_relative "sessions_view"

class SessionsController
    def initialize(employee_repository)
        @employee_repository = employee_repository
        @sessions_view = SessionsView.new
    end

    def login
        loop do
          username = @sessions_view.ask("username?")
          password = @sessions_view.ask("password?")

          employee = @employee_repository.find_by_username(username)

          if employee and employee.password == password
            @sessions_view.display_message("Welcome #{employee.username.capitalize}!")
            return employee
          else
            @sessions_view.display_message('wrong credentials')
          end
        end
    end
end