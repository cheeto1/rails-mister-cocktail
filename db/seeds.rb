require "json"
require "open-uri"

Ingredient.destroy_all
Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
results = JSON.parse(open(url).read)
puts results

results['drinks'].each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
  puts "#{drink}"
end

mojito = Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Martini')
Cocktail.create(name: 'Long Island')

Dose.create(description: "cocktail with mint", cocktail: mojito, ingredient: Ingredient.first)
