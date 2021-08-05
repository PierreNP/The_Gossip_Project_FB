# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[City, User, Comment, PrivateMessage, UserPrivateMessage, Tag, Gossip, GossipTag].map {|tab| tab.destroy_all}
['cities', 'users', 'comments', 'private_messages', 'user_private_messages', 'tags', 'gossips', 'gossip-tags'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

city_list = [["Paris","75000"],["Lyon","69000"],["Marseille","13000"],["Nice","06000"],["Bordeaux","33000"],["Strasbourg","67000"],["Rennes","35000"],["Toulouse","31000"],["Caen","14000"],["Toulon","83000"]]

tag_list = ['Humour', 'evil', 'event', 'people', 'business', 'sport']

10.times do |i|
  City.create(name: city_list[i][0], zip_code:city_list[i][1])
end

#Création User anonyme
User.create(first_name: 'Anonymous', last_name: 'Anonymous', age:'50', email: 'anonymous@anonymous.com' , description: 'je suis un anonyme anonyme', city_id: 1, password: 'password1')

20.times do
  User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(18..90), email:Faker::Internet.email , description:Faker::Lorem.sentences(number: 2).join(" "), city_id:rand(1..City.count), password: ['password', (User.count+1).to_s].join)
end

tag_list.map {|tag| Tag.create(title: tag)}

50.times do
  created_gossip = Gossip.create(title:Faker::Lorem.words(number: 2).join(" "), content:Faker::Lorem.sentences(number: 2).join(" "), user_id:rand(1..User.count))
  rand(0..3).times do
    GossipTag.create(gossip_id: created_gossip.id, tag_id:rand(1..5))
  end
end

20.times do
  Comment.create(content:Faker::Lorem.sentences(number: 1).join(), gossip_id:rand(1..Gossip.count) , user_id:rand(1..User.count))
end

40.times do
  choose_which_author = [Faker::ChuckNorris.fact, Faker::Quote.yoda]
  created_pm = PrivateMessage.create(content:choose_which_author[rand(0..1)], sender_id:rand(1..User.count))
  rand(1..3).times do
    UserPrivateMessage.create(received_message_id: created_pm.id, recipient_id: rand(1..User.count))
  end
end

