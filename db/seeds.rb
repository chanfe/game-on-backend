# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

felix = User.create(name: 'Felix Chan', username: 'nexe', password:'123')
will = User.create(name: 'Will', username:'will', password:'123')

Score.create(points:100, user:felix)
Score.create(points:1000, user:will)
