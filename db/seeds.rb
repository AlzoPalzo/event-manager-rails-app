# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ali = User.create(name: "Ali", age: 25, password: "ali", bio: "I'm Ali and I am the best. However I am incapable of spelling")
khang = User.create(name: "Khang", age: 25,password: "khang", bio: "I'm Khang and I chat breeze in french")
faiz = User.create(name: "Faiz", age: 23,password: "123", bio: "If I'm not chatting shit. I'm not chatting ")
alex = User.create(name: "Alex", age: 29,password: "123", bio: "I am a perfectionist. I like stuff.")
tom = User.create(name: "Tom", age: 28,password: "123", bio: "What up gang Tom here. Ready to smash some Javascript up")
louis = User.create(name: "Louis", age: 20,password: "123", bio: "King of cambeo, Louis. Ready to get smoked?")
charlotte = User.create(name: "Charlotte", age: 27,password: "123", bio: "Best mod 1 project ever.")
manu = User.create(name: "Manu", age: 106,password: "123", bio: "I use to program with sticks and stones")
harry = User.create(name: "Harry", age: 106,password: "123", bio: "Willing to take ruby off the rails")
sal = User.create(name: "Sal", age: 27,password: "123", bio: "Sal please stop smoking")
byron = User.create(name: "Byron", age: 27,password: "123", bio: "Byron please stop smoking")
daniel = User.create(name: "Daniel", age: 27,password: "123", bio: "Daniel please stop smoking")
wachira = User.create(name: "Wachira", age: 28,password: "123", bio: "Your boy Wachira redifing whats expected from a TCF")
marju = User.create(name: "Marju", age: 25,password: "123", bio: "Good luck marju. All the best")
mariam = User.create(name: "Mariam", age: 28,password: "123", bio: "Mariam here. Don't mess with y'all.")
laura = User.create(name: "Laura", age: 27,password: "123", bio: "Laura. Champion of the people")
max = User.create(name: "Max", age: 30,password: "123", bio: "Mad Max. Pokemon project extrodanaire.")
kai = User.create(name: "Kai", age: 22,password: "123", bio: "I am Kai, I am Kai, I am Kai")
calie = User.create(name: "Calie", age: 30,password: "123", bio: "Mad rapper, folky ballad lyricist")


# User.all.each do |user|
#     if  user.id != User.first.id
#         Friend.create(user_id: User.first.id, friend_id: user_id)
#     end
#
#     if  user.id != User.first.id && user.id != User.second.id
#         Friend.create(user_id: User.second.id, friend_id: user_id)
#     end
# end
