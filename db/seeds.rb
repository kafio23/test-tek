# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Admin user"
admin = User.new
admin.full_name = "Administrador"
admin.email = "admin@pedidos.com"
admin.password = "lima1234"
admin.role = "admin"
admin.save!

puts "Creating common user"
user = User.new
user.full_name = "Peddie Dorh"
user.email = "user@nosesabe.com"
user.password = "lima4321"
user.role = "user"

user.save!