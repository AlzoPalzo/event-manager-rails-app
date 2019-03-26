# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

khang = User.create(name: "Khang", age: "25", bio: "Crypto man.")
ali = User.create(name: "Ali", age: "25", bio: "Literally, actually the best.")

occasion1 = khang.occasions.create(name: 'Flatiron end of mod 2 party', date_time: Time.now, description: "The coolest party of the month")
 
