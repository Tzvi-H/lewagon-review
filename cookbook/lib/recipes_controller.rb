require_relative 'recipes_view'
require_relative 'recipe'

class RecipesController
  # initialize(cookbook) takes an instance of the Cookbook as an argument.
  def initialize(cookbook)
    @cookbook = cookbook
    @view = RecipesView.new
  end

  # list all the recipes
  def list
    @view.display(@cookbook.all)
  end

  # create a new recipe
  def create
    name = @view.ask('What is the name')
    description = @view.ask('What is the description')
    @cookbook.add_recipe(Recipe.new(name, description))
    list
  end

  # destroy an existing recipe
  def destroy
    list
    index = @view.ask('Which recipe do you want to delete')
    @cookbook.remove_recipe(index.to_i - 1)
    list
  end
end