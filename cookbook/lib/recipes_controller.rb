require_relative 'recipes_view'
require_relative 'recipe'
require "nokogiri"
require "open-uri"

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

  def import
    keyword = @view.ask('What ingredient would you like a recipe for')
    @view.display_message("Looking for \"#{keyword}\" recipes on the Internet...")
    url = "https://www.allrecipes.com/search/results/?search=#{keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, "utf-8")

    elements = doc.search('.card__detailsContainer').first(5)
    names = elements.map do |element|
      element.search('.card__title').text.strip
    end
    @view.display_online_recipes(names)
    index = @view.ask('Which recipe would you like to import? (enter index)').to_i

    name = names[index - 1]
    description = elements[index - 1].search('.card__summary').text.strip

    @view.display_message("Importing #{name}...")

    @cookbook.add_recipe(Recipe.new(name, description))
    list
  end
end