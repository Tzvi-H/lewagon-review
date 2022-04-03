require_relative 'router'
require_relative 'recipes_controller'
require_relative 'cookbook'

cookbook = Cookbook.new('recipes.csv')
controller = RecipesController.new(cookbook)
router = Router.new(controller)

router.run()