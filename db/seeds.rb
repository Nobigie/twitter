# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_list = [
  [ "Victor Debost", "vdebost@gmail.com", "22121985", "22121985", 1 ],
  [ "Barak Obama", "barack@whitehouse.com", "22121985", "22121985", 0 ],
  [ "Bea Fontanillo", "beafonta@gmail.com", "22121985", "22121985", 0 ],
  [ "Chasity Mertens", "test1@gmail.com", "22121985", "22121985", 0 ],
  [ "Reid Ritzer", "test2@gmail.com", "22121985", "22121985", 0 ],
  [ "Roselee Valois", "test3@gmail.com", "22121985", "22121985", 0 ],
  [ "Leeann Thrift", "test4@gmail.com", "22121985", "22121985", 0 ],
  [ "Allie Petway", "test5a@gmail.com", "22121985", "22121985", 0 ],
  [ "Genevive Shivers", "test6@gmail.com", "22121985", "22121985", 0 ],
  [ "Emmett Servin", "test7@gmail.com", "22121985", "22121985", 0 ],
  [ "Veronika Speers", "test8@gmail.com", "22121985", "22121985", 0 ],
  [ "Ricky Ison", "test9@gmail.com", "22121985", "22121985", 0 ],
  [ "Brian Wickersham", "test10@gmail.com", "22121985", "22121985", 0 ],
  [ "Kevin Wickersham", "test11@gmail.com", "22121985", "22121985", 0 ],
  [ "Steven Wickersham", "test12@gmail.com", "22121985", "22121985", 0 ],
  [ "Mary Wickersham", "test13@gmail.com", "22121985", "22121985", 0 ],
  [ "Lee Wickersham", "test14@gmail.com", "22121985", "22121985", 0 ],
  [ "Kim Wickersham", "test15@gmail.com", "22121985", "22121985", 0 ],
  [ "Bob Wickersham", "test16@gmail.com", "22121985", "22121985", 0 ],
  [ "PouPou Wickersham", "test17@gmail.com", "22121985", "22121985", 0 ],
  [ "Gerard Wickersham", "test18@gmail.com", "22121985", "22121985", 0 ],
  [ "Jean Jaques Wickersham", "test19@gmail.com", "22121985", "22121985", 0 ],
  [ "Martin Macaron", "Macaron@gmail.com", "22121985", "22121985", 0 ]
]


user_list.each do |name, email, password, confirmation, admin|
  @user=User.create( name: name, email: email, password: password, password_confirmation: confirmation, admin: admin)
end

users = User.all
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
  end

user  = users.first
followed_users = users[2..10]
followers      = users[3..20]
followed_users.each { |followed| user.follow!(followed) }
followers.each      { |follower| follower.follow!(user) }