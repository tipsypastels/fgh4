# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GEMS = %w|diamond pearl platinum ruby sapphire emerald crystal amythest topaz lapis garnet spinel zircon tourmaline citrine morganite opal peridot rubellite spinel|

# User.where.not(username: 'dakota').destroy_all
# 25.times do |i|
#   User.create! username: Faker::Name.unique.first_name,
#                email: "user-#{i}@fgh.io",
#                password: 'bad-password545'
# end

# Recording.where.not(slug: 'gnosis').destroy_all
# 25.times do
#   Recording.create! type: 'Game', 
#                     name: "Pokemon #{GEMS.sample.capitalize}", 
#                     user_id: User.ids.sample
# end

Reply.destroy_all
250.times do
  recording = Recording.order('random()').take

  Reply.create! type: 'Comment',
                content: Faker::Quotes::Shakespeare.hamlet_quote,
                recording: recording,
                user_id: User.ids.sample,
                parent_id: rand(0...100) <= 50 ? nil : recording.replies.ids.sample
end