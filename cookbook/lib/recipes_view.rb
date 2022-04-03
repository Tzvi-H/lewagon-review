class RecipesView
  def display(recipes)
    system "clear"
    puts "-- All Recipes --"
    puts
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask(question)
    puts
    puts "#{question}?"
    gets.chomp
  end
end