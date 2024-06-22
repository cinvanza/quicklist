puts "Deleting data...."

ListGuest.destroy_all
Product.destroy_all
List.destroy_all
User.destroy_all
Supermarket.destroy_all
Tag.destroy_all

puts "Creating tags..."
Tag.create!([
  {name: "Christmas"},
  {name: "Halloween"},
  {name: "Valentines"},
  {name: "Birthday Party"},
  {name: "Romantic Dinner"},
  {name: "Graduation Party"},
  {name: "Game Night"}])

  puts "Creating supermarkets..."
Supermarket.create!([
  {name: "Carrefour", city: "Mendoza"},
  {name: "Jumbo", city: "Mendoza"},
  {name: "Coto", city: "Mendoza"},
  {name: "Walmart", city: "Mendoza"},
  {name: "Vea", city: "Mendoza"}],
)

puts "Creating users..."
User.create!([
  {first_name: "Jose", last_name: "Cerrato", email: "jose@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Cintia", last_name: "Zavi", email: "cintia@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Vanesa", last_name: "Soledad", email: "vanesa@mail.com", password: "123456", currency: "ARS$", country: "Argentina"},
  {first_name: "Luis", last_name: "Colmenares", email: "luis@mail.com", password: "123456", currency: "ARS$", country: "Argentina"}
])

puts "Creating lists..."
List.create!([
  {name: "Saturday Game Night", date: Date.today, access_type:0, budget: 100000, status:0, user_id: User.first.id, tag_id: Tag.last.id, supermarket_id: Supermarket.first.id}
])

puts "Creating products..."
Product.create!([
  {name: "Cerveza", brand: "Quilmes", price: 3000, quantity: 18, list_id: List.first.id}
])

puts "Creating list guests..."
ListGuest.create!([
  {list_id: List.first.id, user_id: User.last.id}
])
