# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_list = [
  [ "Victor Debost", "vdebost@gmail.com", "22121985", "22121985" ],
  [ "Barak Obama", "barack@whitehouse.com", "22121985", "22121985" ],
  [ "Bea Fontanillo", "beafonta@gmail.com", "22121985", "22121985" ],
  [ "Chasity Mertens", "test1@gmail.com", "22121985", "22121985" ],
  [ "Reid Ritzer", "test2@gmail.com", "22121985", "22121985" ],
  [ "Roselee Valois", "test3@gmail.com", "22121985", "22121985" ],
  [ "Leeann Thrift", "test4@gmail.com", "22121985", "22121985" ],
  [ "Allie Petway", "test5a@gmail.com", "22121985", "22121985" ],
  [ "Genevive Shivers", "test6@gmail.com", "22121985", "22121985" ],
  [ "Emmett Servin", "test7@gmail.com", "22121985", "22121985" ],
  [ "Veronika Speers", "test8@gmail.com", "22121985", "22121985" ],
  [ "Ricky Ison", "test9@gmail.com", "22121985", "22121985" ],
  [ "Brian Wickersham", "test10@gmail.com", "22121985", "22121985" ],
  [ "Martin Macaron", "test11@gmail.com", "22121985", "22121985" ]
]


user_list.each do |name, email, password, confirmation|
  User.create( name: name, email: email, password: password, password_confirmation: confirmation)
end