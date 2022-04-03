require "csv"
require_relative "recipe"

class Cookbook
  # initialize(csv_file_path) which loads existing Recipe from the CSV
  def initialize(filepath)
    @recipes = []
    @filepath = filepath

    CSV.foreach(filepath, headers: :first_row) do |row|
      @recipes << Recipe.new(row['Name'], row['Description'])
    end
  end

  # all which returns all the recipes
  def all
    return @recipes
  end

  # add_recipe(recipe) which adds a new recipe to the cookbook
  def add_recipe(recipe)
    @recipes << recipe

    CSV.open(@filepath, "ab") do |csv|
      csv << [recipe.name, recipe.description]
    end
  end

  # remove_recipe(recipe_index) which removes a recipe from the cookbook.
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)

    CSV.open(@filepath, "wb") do |csv|
      csv << ["Name", "Description"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end