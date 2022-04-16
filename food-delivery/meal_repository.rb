require "csv"
require_relative "meal"

class MealRepository
    def initialize(filename)
        @filename = filename
        @meals = []

        CSV.foreach(filename, headers: :first_row) do |row|
            @meals << Meal.new(row['id'], row['name'], row['price'])
        end

        @next_id = @meals.empty? ? 1 : @meals.last.id.to_i + 1
    end

    def create(name, price)
        
        meal = Meal.new(@next_id, name, price)
        @next_id += 1

        @meals << meal

        CSV.open(@filename, "ab") do |csv|
            csv << [meal.id, meal.name, meal.price]
        end
    end

    def all
        @meals
    end

    def find(id)
        @meals.find {|meal| meal.id == id.to_s}
    end
    
end


# This repository is initialized with a CSV file path. 
# It reads and writes the meals from the CSV file and holds them as objects in an array. 
#The behavior we want for the repository is to:

# create a new meal
# Get all the meals
# find a specific meal thanks to its id

# Write some code to implement this and crash-test your repository. 
#You should create your own meals.csv CSV file inside the data folder. 
#Then test your code by running rake meal.