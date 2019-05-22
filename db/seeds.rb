# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurants = Category.create(name: "Restaurants", selected: false, weight: 1)
fitness = Category.create(name: "Fitness", selected: false, weight: 1)
arts = Category.create(name: "Arts", selected: false, weight: 1)

