puts "Deleting data...."

ListGuest.destroy_all
Product.destroy_all
List.destroy_all
User.destroy_all
Supermarket.destroy_all
Tag.destroy_all

puts "Creating tags..."
tags = Tag.create!([
  {name: "Christmas", image: "tree"},
  {name: "Halloween", image: "ghost"},
  {name: "Valentines", image: "heart"},
  {name: "Birthday Party", image: "birthday-cake"},
  {name: "Romantic Dinner", image: "wine-glass-alt"},
  {name: "Graduation Party", image: "graduation-cap"},
  {name: "Game Night", image: "gamepad"},
  {name: "Home and Garden", image: "home"},
  {name: "Daily Chores", image: "check"},
  {name: "Kids Groceries", image: "apple-alt"}
])

# puts "Creating supermarkets..."
# supermarkets = Supermarket.create!([
#   {name: "Carrefour", city: "Mendoza"},
#   {name: "Jumbo", city: "Mendoza"},
#   {name: "Coto", city: "Mendoza"},
#   {name: "Walmart", city: "Mendoza"},
#   {name: "Vea", city: "Mendoza"}
# ])

puts "Creating users..."
users = User.create!([
  {first_name: "Jose", last_name: "Cerrato", email: "jose@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Cintia", last_name: "Zavi", email: "cintia@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Vanesa", last_name: "Soledad", email: "vanesa@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Luis", last_name: "Colmenares", email: "luis@mail.com", password: "123456", currency: "ARS$", country: "Argentina"}
])

# puts "Creating lists..."
# list_names = [
#   "Saturday Game Night", "Sunday Family Dinner", "Monday Movie Night",
#   "Tuesday Office Party", "Wednesday BBQ", "Thursday Potluck",
#   "Friday Happy Hour", "Weekend Getaway", "Holiday Feast", "New Year Bash"
# ]

# products = [
#   {name: "Yerba Mate", brand: "Taragüi", price: 400, quantity: 1},
#   {name: "Chimichurri", brand: "La Parmesana", price: 200, quantity: 2},
#   {name: "Malbec Wine", brand: "Alamos", price: 1000, quantity: 3},
#   {name: "Dulce de Leche", brand: "La Serenísima", price: 250, quantity: 2},
#   {name: "Empanadas", brand: "Criollas", price: 500, quantity: 12},
#   {name: "Chorizo", brand: "Paladini", price: 800, quantity: 6},
#   {name: "Provoleta", brand: "Sancor", price: 350, quantity: 1},
#   {name: "Asado", brand: "El Gaucho", price: 2000, quantity: 5},
#   {name: "Fernandito", brand: "Fernet Branca", price: 750, quantity: 1},
#   {name: "Alfajores", brand: "Havanna", price: 300, quantity: 12}
# ]

# list_names.each do |list_name|
#   list = List.create!(
#     name: list_name,
#     date: Date.today,
#     access_type: 0,
#     budget: 100000,
#     status: 0,
#     user: users.sample,
#     tag: tags.sample,
#     supermarket: supermarkets.sample
#   )

#   7.upto(10) do
#     product = products.sample
#     Product.create!(
#       name: product[:name],
#       brand: product[:brand],
#       price: product[:price],
#       quantity: product[:quantity],
#       list: list
#     )
#   end

#   users.sample(3).each do |user|
#     ListGuest.create!(
#       list: list,
#       user: user
#     )
#   end
# end

puts "Seeding completed!"
