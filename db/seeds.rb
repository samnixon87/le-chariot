# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Destroy
pp "Killing users first. Goodbye users"
User.destroy_all
pp "Now destroying issue seeds. Burning them with fire..."
Issue.destroy_all
pp "Now destroying channel seeds. Burning them with fire..."
Channel.destroy_all
pp "Done."

# Create new users
pp "Reincarnating users..."

10.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Games::ElderScrolls.last_name,
    nickname: Faker::Internet.username,
    batch: 1122,
    role: true
  )
  pp "Seeding users..."
end

# Create users for dev
pp "Creating admin accounts"
User.create(email: "sam@gmail.com", password: "123123", nickname: "Sam")
User.create(email: "admin@admin.com", password: "123123", nickname: "Admin")

# Create new channels
pp "Creating channel seeds..."

["Ruby", "Rails", "HTML", "CSS", "JS", "Stimulus", "React"].each do |channel|
  Channel.create!(name: channel)
end

# Create new issues
pp "Creating issue seeds..."

pp "Starting with some Ruby ones."

Issue.create!(
  title: "Random record in ActiveRecord",
  description: "I'm in need of getting a random record from a table via ActiveRecord. I've followed the example from Jamis Buck from 2006. However, I've also come across another way via a Google search (can't attribute with a link due to new user restrictions)...",
  rating: 4,
  channel_id: 1,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to trace method call in class instance in ruby",
  description: "How can i get traceback of method calls i did cat.sound, cat.food, cat.inspect so then i can prove that ruby found the method in correct class? (sound at Cat, food at Pet, and inspect at Object)",
  rating: 5,
  channel_id: 1,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How do I pick randomly from an array?",
  description: "I want to know if there is a much cleaner way of doing this. Basically, I want to pick a random element from an array of variable length. Is there something that is more readable / simpler to replace the second line? Or is that the best way to do it. I suppose you could do myArray.shuffle.first, but I only saw #shuffle a few minutes ago on SO, I haven't actually used it yet..",
  rating: 4,
  channel_id: 1,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

pp "Now adding the rest..."

Channel.all.each do |channel|
  rand(0..30).times do
    Issue.create!(
      title: "#{["Help with", "Can't seem to", "What is", "I've been struggling with", "Help...", "WTF is"].sample} #{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.abbreviation}",
      description: "#{Faker::Hacker.say_something_smart}",
      rating: rand(1..5),
      channel_id: channel.id,
      user_id: User.order(Arel.sql('RANDOM()')).first.id
    )
    pp "Seeding issues..."
  end
end

pp "Created #{User.count} users."
pp "Created #{Issue.count} issues."
pp "Created #{Channel.count} channels."
pp "New seeds have been created. Long live the new seeds"
