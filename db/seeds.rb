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
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    first_name: Faker::Name.first_name,
    last_name: Faker::Games::ElderScrolls.last_name,
    batch: 1122,
    role: true
  )
  pp "Seeding users..."
end


# Create new channels
pp "Creating channel seeds..."

5.times do
  Channel.create!(
    name: "#{Faker::Hobby.activity}"
  )
  pp "Seeding channels..."
end

# Create new issues
pp "Creating issue seeds..."

#5.times do
  Issue.create!(
    description: "I need someone to explain #{Faker::Hobby.activity} to me in detail.",
    rating: rand(1..5),
    channel_id: 1,
    user_id: 1
  )
  pp "Seeding issues..."
#end

pp "Created #{User.count} users."
pp "Created #{Issue.count} issues."
pp "Created #{Channel.count} channels."
pp "New seeds have been created. Long live the new seeds"
