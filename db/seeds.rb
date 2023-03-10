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
User.create(email: "sam@gmail.com", password: "123123", nickname: "Sam", batch: "1122")
User.create(email: "admin@admin.com", password: "123123", nickname: "Admin", batch: "1122")

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

Issue.create!(
  title: "What is the MVC architecture?",
  description: "I am a beginner in web development and I am trying to build a web application using a popular programming language and framework. I have heard about the Model-View-Controller (MVC) architecture but I don't understand what it is and how to use it in my project. Can someone explain the MVC architecture and provide some guidance on how to implement it in my web application?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How do you configure the database?",
  description: "As a beginner in web development, I am unsure how to configure the database for my web application. I have created my models and defined the schema but I don't know how to connect it to the database. Can someone guide me on how to configure the database and establish a connection to it?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to handle authentication and authorization?",
  description: "I am new to web development and I am building a web application that requires user authentication and authorization. I don't know where to start and how to implement these features. Can someone explain to me the concepts of authentication and authorization and guide me on how to handle them in my web application?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How do you deal with routing?",
  description: "I am new to web development and I am building a web application using a popular programming language and framework. I am not sure how to handle routing and create the necessary routes for my web pages. Can someone explain to me the basics of routing and guide me on how to set up routes in my web application?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to implement validations and error handling?",
  description: "I am a beginner in web development and I am building a web application. I am not sure how to implement validations and error handling to ensure that my users enter valid data and to handle any errors that may occur. Can someone guide me on how to implement validations and error handling in my web application?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to navigate the Rails console?",
  description: "As a recent graduate of the LeWagon bootcamp, I am still struggling to navigate the Rails console. Although I learned the basics of using the console during the bootcamp, I am still unsure how to perform more advanced operations such as joining tables or executing complex queries. Can someone provide me with some guidance on how to navigate the Rails console more efficiently and effectively?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to manage assets and static files?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure how to manage assets and static files in my Ruby on Rails application. I have some CSS and JavaScript files that I want to use in my project, but I don't know where to put them or how to link them to my views. Can someone provide me with some guidance on how to manage assets and static files in a Ruby on Rails application?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to work with forms in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure how to work with forms in my Ruby on Rails application. I want to create a form that allows users to submit data to my application, but I don't know where to start or what components to use. Can someone provide me with some guidance on how to work with forms in a Ruby on Rails application and handle the submitted data?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "What is the process for testing in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure of the process for testing my Ruby on Rails application. I understand the importance of testing to ensure my application functions as expected, but I don't know where to start or how to write effective tests. Can someone provide me with some guidance on the process for testing in a Ruby on Rails application and how to write effective tests?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to deploy a Rails app?",
  description: "As a recent graduate of the LeWagon bootcamp, I am struggling to deploy my Ruby on Rails application. I have tried deploying it on Heroku, but the process was difficult to understand, and the application did not work correctly once it was deployed. I am now unsure of what to do next and where to start to successfully deploy my application. Can someone provide me with some guidance on how to deploy a Ruby on Rails application, besides Heroku, and ensure it is running smoothly?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to integrate third-party APIs in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure of how to integrate third-party APIs in my Ruby on Rails application. I want to add features to my application by using APIs from external services, but I am not sure where to start or how to handle the data returned by the API. Can someone provide me with some guidance on how to integrate third-party APIs in a Ruby on Rails application, and how to effectively handle the data they return?",
  rating: 4,
  channel_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

pp "Now adding pre-made responses"
pp "Adding responses to the first issue..."

Message.create!(
content: "Both methods are valid and will give you a random record from the table, but there are some differences to consider. The first method you mentioned from Jamis Buck involves using a random ordering of the records, and then selecting the first record from that ordering. This approach can be slow for large tables, as it requires the database to sort all of the records before selecting the first one. However, it may be more precise if you want a truly random record, as it ensures that all records have an equal chance of being selected. The second method you found involves generating a random ID and then selecting the first record with an ID greater than or equal to that random ID. This approach is faster, as it only needs to look up a single record based on its ID. However, it may not be as precise, as there could be gaps in the ID sequence (e.g. if records were deleted), which could skew the distribution of selected records. In terms of efficiency, the second method is likely to be faster for large tables, but the first method may be more precise. Ultimately, the best approach will depend on your specific use case and performance requirements.",
rating: 4,
issue_id: 1,
user_id: User.order(Arel.sql('RANDOM()')).first.id,
pinned: true
)

Message.create!(
  content: "Then your proposed solution is close to ideal :) I'd use 'SELECT MAX(id) FROM table_name' instead of the COUNT(*) as it will deal with deleted rows a bit better, otherwise, the rest is fine. In short, if 'good enough' is ok, then you just have to have a method that assumes a distribution close to what you actually have. If it's uniform and even as you've said, simple rand works great.",
  rating: 4,
  issue_id: 1,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
  )

pp "Adding responses to the second issue..."

Message.create!(
  content: "Have you considered a static analyzer or are you only looking for something that actually runs the code? Doxygen outputs some nice caller/callee graphs, haven't looked to see if it supports Ruby but call graphs can prove very useful for understanding existing code.",
  rating: 4,
  issue_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
  )

Message.create!(
  content: "I'm fairly sure Doxygen doesn't support Ruby - if it did, it would certainly be useful to me, but I can't find any info about Doxygen supporting Ruby. I'd prefer to have something that actually runs the code, primarily because the order in which require's get processed will affect which of the multiple (non-identical) definitions of a given method will be used. As I said, it's an ugly code base...",
  rating: 4,
  issue_id: 2,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
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
