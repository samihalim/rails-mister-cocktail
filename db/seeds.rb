# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Cocktail.destroy_all
Ingredient.destroy_all

result = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']
drinks.each do |hash|
  hash.each do |k, v|
    Ingredient.create!(name: v)
  end
end
lists = ['mojito', 'rum', 'pinacolda', 'vodka']
lists.each do |cocktail|
  Cocktail.create(
    name: cocktail
    )
end
puts "#{Cocktail.count} cocktails created"
puts "#{Ingredient.count} ingredients created"


Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
