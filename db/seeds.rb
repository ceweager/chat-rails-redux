# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying all users'
User.destroy_all
puts 'users destroyed'
puts 'destroying all channels'
Channel.destroy_all
puts 'channels destroyed'
puts 'destroying all messages'
Message.destroy_all

default_channels = ["general", "paris", "react"]
default_users = [
  {
    email: "user-one@me.com", 
    password: "test1234"
  },
  { 
    email: "user-two@me.com",
    password: "test1234"
  }
]

default_channels.each do |channel|
  new_channel = Channel.new(
    name: channel
  )
  new_channel.save
  puts "created #{new_channel.name}"
end

default_users.each do |user|
  puts "#{user}"
  new_user = User.new
  new_user.email = user[:email]
  new_user.password = user[:password]
  new_user.save!
  puts "created #{new_user.email}"
  message = Message.new
  message.content = "This is a test message"
  message.user_id =  new_user.id
  message.channel_id = Channel.all.sample.id
  message.save!
  puts "created #{message.content}"
end
