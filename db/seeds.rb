require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
Ingredient.destroy_all
puts "ingredients destroyed"
puts "creating ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

results = JSON.parse(open(url).read)

ingredients = results['drinks']
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
puts "done"

Cocktail.destroy_all
puts 'Creating cocktails...'
cocktails_attributes = [
  {
    name:         'Mojito'
  },
  {
    name:         'White Russian'
  },
  {
    name:         'Bloody Mary'
  },
  {
    name:         'Old Fashioned'
  },
  {
    name:         'Pinha Colada'
  }
]
Cocktail.create!(cocktails_attributes)
