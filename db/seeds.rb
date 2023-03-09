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
    batch: 1122,
    role: true
  )
  pp "Seeding users..."
end

# Create users for dev
pp "Creating admin accounts"
User.create(email: "sam@gmail.com", password: "123123")
User.create(email: "admin@admin.com", password: "123123")

# Create new channels
pp "Creating channel seeds..."

["Ruby", "Rails", "HTML", "CSS", "JS", "Stimulus", "React"].each do |channel|
  Channel.create!(name: channel)
end

# Create new issues
pp "Creating issue seeds..."

Channel.all.each do |channel|
  rand(0..4).times do
    Issue.create!(
      title: "Help with #{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.abbreviation}",
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
