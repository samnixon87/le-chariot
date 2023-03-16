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
pp "Now destroying message seeds. Burning them with fire..."
Message.destroy_all
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
    image: ["avatar-blue.jpeg", "avatar-purple.jpeg", "avatar-blue.jpeg", "avatar-orange.jpeg"].sample,
    description: Faker::Movies::HarryPotter.quote,
    batch: [1122, 104, 678, 1011, 903, 768, 542, 59, 897, 672, 901, 478, 124, 762].sample,
    role: true
  )
  pp "Seeding users..."
end

# Create users for dev
pp "Creating admin accounts"
User.create(email: "sam@gmail.com", password: "123123", nickname: "Sam", batch: "1122", image: "avatar-purple.jpeg", description: "Extremely helpful code boi")
User.create(email: "admin@admin.com", password: "123123", nickname: "Admin", batch: "1122", image: "avatar-blue.jpeg", description: "Admin friend")

# Create new channels
pp "Creating channel seeds..."

["Ruby", "Rails", "HTML", "CSS", "JS", "Stimulus", "React"].each do |channel|
  Channel.create!(name: channel)
end

# Create new issues
pp "Creating issue seeds..."

pp "Let's begin with the filler..."

Channel.all.each do |channel|
  rand(5..15).times do
    Issue.create!(
      title: "#{["Help with", "Can't seem to", "What is", "I've been struggling with", "Help..."].sample} #{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.abbreviation}",
      description: "#{Faker::Hacker.say_something_smart}",
      rating: rand(1..5),
      channel_id: Channel.all.sample.id,
      user_id: User.order(Arel.sql('RANDOM()')).first.id
    )
    pp "Seeding issues..."
  end
end

Issue.all.each do |issue|
  rand(1..4).times do
    Message.create!(
      content: "#{Faker::Hacker.say_something_smart}",
      rating: 3,
      issue_id: issue.id,
      user_id: User.order(Arel.sql('RANDOM()')).first.id,
      pinned: true
    )
  pp "Seeding messages"
  end
end

pp "Now, to the thriller..."

pp "Starting with some Ruby ones."

Issue.create!(
  title: "Random record in ActiveRecord",
  description: "I'm in need of getting a random record from a table via ActiveRecord. I've followed the example from Jamis Buck from 2006. However, I've also come across another way via a Google search (can't attribute with a link due to new user restrictions)...",
  code_block: 'rand_id = rand(Model.count)
  rand_record = Model.first(:conditions => ["id >= ?", rand_id])',
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "I'm assuming you are using ActiveRecord? Add this to your ActiveRecord query: .order('events.date ASC, featureds.date ASC')",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "That will show the events first and then the featureds which is not what I am trying to achieve. I've updated the original post to reflect what I mean.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "2 points that might help an answer. 1. How evenly distributed are your ids, are they sequential? 2. How random does it need to be? Good enough random, or real random?",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "In Rails 7, you could do:
  For MySQL:

  Model.order('RAND()').limit(1)
  Postgres/SQLite:

  Model.order('RANDOM()').limit(1)
  ",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "To add to that, in Rails 6 non-attribute arguments are not allowed. You have to wrap the value in an Arel.sql() statement. So something like:

  Model.order(Arel.sql('RANDOM()')).first",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Issue.create!(
  title: "How to trace method call in class instance in ruby",
  description: "How can i get traceback of method calls i did cat.sound, cat.food, cat.inspect so then i can prove that ruby found the method in correct class? (sound at Cat, food at Pet, and inspect at Object)",
  code_block: 'class Pet
  def food
    "food"
  end
 end

 class Cat < Pet
   def sound
    "meow"
   end
 end

 cat = Cat.new
 cat.sound
 cat.food
 cat.inspect',
  rating: 5,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "What looks like inconsistent return values for name during runtime and while debugging doesn't seem to related to Pry, but more about binding itself encapsulating the entire execution context of a method, versus the progressive change in what shadowed variables reference at runtime. To build on the example method with some more debugging code.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "Ruby has 'reflection' for this. It's super handy.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: " With reflection you can do things like:
  cat = Cat.new
  cat.method(:sound)
  => #<Method: Cat#sound() (irb):8>
  cat.method(:food)
  => #<Method: Cat(Pet)#food() (irb):2>",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)


Message.create!(
  content: "Yeah, reflection is great. It's sort of like 'inspect' for methods.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "With that you can kind of do a traceback of method calls like you did with cat.sound, cat.food, cat.inspect so then you can prove that ruby found the method in correct class.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "+1 for reflection. It's great",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Issue.create!(
  title: "How do I pick randomly from an array?",
  description: "I want to know if there is a much cleaner way of doing this... I want to pick a random element from an array of variable length. Is there something that is more readable / simpler to replace the second line? Or is that the best way to do it. I suppose you could do myArray.shuffle.first, but I only saw #shuffle a few minutes ago on SO, I haven't actually used it yet..",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "You can use .sample. It's available from Ruby 1.9.1 onwards.

  To be also able to use it with an earlier version of Ruby, you could require 'backports/1.9.1/array/sample' but my genuine hope for you is that you don't have to make your code backwards compatible that far back 😄.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "myArray.sample(x) can also help you to get x random elements from the array. I've found this weirdly helpful many, many times.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "It worths noting that my_array.sample(1) != my_array.sample.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "Yeah, perversely it's not. But `myArray.sample` will return 1 random value and `myArray.shuffle.first` will also return 1 random value.

  .. So that's fun.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "+1 for this question",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "+1 for .sample 🙏",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Issue.create!(
  title: "Beginners MVC",
  description: "I am trying to build a web app using a Rails and Stimulus. I have dim memories of the Model-View-Controller (MVC) architecture but I can't remember what it is and how to use it in my project. Can someone explain the MVC architecture and provide some guidance on how to implement it in my web application?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "Configure my database...",
  description: "As a beginner in web development, I am unsure how to configure the database for my web application. I have created my models and defined the schema but I don't know how to connect it to the database. Can someone guide me on how to configure the database and establish a connection to it?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to handle authentication and authorization?",
  description: "I'm building a web application that requires user authentication and authorization. I don't know where to start and how to implement these features. Can someone explain to me the concepts of authentication and authorization and guide me on how to handle them in my web application?",
  code_block: "class Auth0Controller < ApplicationController
  def callback
    # OmniAuth stores the information returned from Auth0 and the IdP in request.env['omniauth.auth'].
    # In this code, you will pull the raw_info supplied from the id_token and assign it to the session.
    # Refer to https://github.com/auth0/omniauth-auth0#authentication-hash for complete information on 'omniauth.auth' contents.
    auth_info = request.env['omniauth.auth']
    session[:credentials] = {}
    session[:credentials][:id_token] = auth_info['credentials']['id_token']
    session[:credentials][:access_token] = auth_info['credentials']['token']

    # Redirect to the URL you want after successful auth
    redirect_to '/dashboard'
  end

  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params['message']
  end

  def logout
    # you will finish this in a later step
  end
end",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How do you deal with routing?",
  description: "I am new to web development and I am building a web application using a popular programming language and framework. I am not sure how to handle routing and create the necessary routes for my web pages. Can someone explain to me the basics of routing and guide me on how to set up routes in my web application?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How do you implement validations and error handling in Ruby models?",
  description: "I am not sure how to implement validations and error handling to ensure that my users enter valid data and to handle any errors that may occur. Can someone guide me on how to implement validations and error handling in my web application?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "Have you considered a static analyzer or are you only looking for something that actually runs the code? Doxygen outputs some nice caller/callee graphs, haven't looked to see if it supports Ruby but call graphs can prove very useful for understanding existing code.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
)

Message.create!(
  content: "I'm fairly sure Doxygen doesn't support Ruby - if it did, it would certainly be useful to me, but I can't find any info about Doxygen supporting Ruby. I'd prefer to have something that actually runs the code, primarily because the order in which require's get processed will affect which of the multiple (non-identical) definitions of a given method will be used. As I said, it's an ugly code base...",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
)

Message.create!(
  content: "I like Grafana personally",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
)

Message.create!(
  content: "Logz.io is pretty sweet",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
  )

Message.create!(
  content: "Tbh, there are a bunch of good logging tools but just follow the basics:

  Enable logging: This sounds obvious, but double check you have enabled logging (in whatever tool you use) before deploying your application and don’t solely rely on your infrastructure logging.

  Categorize your logs: As an application grows in usage, the quantity of logs it generates will grow and the ability to filter logs to particular categories or error levels such as authorization, access, or critical can help you drill down into a barrage of information.

  Logs are for everyone: Your logs are useful sources of information for a variety of stakeholders including support and QA engineers, and new programmers on your team. Keep them readable, understandable and with a clear purpose.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
  )

Issue.create!(
  title: "How to navigate the Rails console?",
  description: "As a recent graduate of the LeWagon bootcamp, I am still struggling to navigate the Rails console. Although I learned the basics of using the console during the bootcamp, I am still unsure how to perform more advanced operations such as joining tables or executing complex queries. Can someone provide me with some guidance on how to navigate the Rails console more efficiently and effectively?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to manage assets and static files?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure how to manage assets and static files in my Ruby on Rails application. I have some CSS and JavaScript files that I want to use in my project, but I don't know where to put them or how to link them to my views. Can someone provide me with some guidance on how to manage assets and static files in a Ruby on Rails application?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to work with forms in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure how to work with forms in my Ruby on Rails application. I want to create a form that allows users to submit data to my application, but I don't know where to start or what components to use. Can someone provide me with some guidance on how to work with forms in a Ruby on Rails application and handle the submitted data?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "What is the process for testing in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure of the process for testing my Ruby on Rails application. I understand the importance of testing to ensure my application functions as expected, but I don't know where to start or how to write effective tests. Can someone provide me with some guidance on the process for testing in a Ruby on Rails application and how to write effective tests?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to deploy a Rails app?",
  description: "As a recent graduate of the LeWagon bootcamp, I am struggling to deploy my Ruby on Rails application. I have tried deploying it on Heroku, but the process was difficult to understand, and the application did not work correctly once it was deployed. I am now unsure of what to do next and where to start to successfully deploy my application. Can someone provide me with some guidance on how to deploy a Ruby on Rails application, besides Heroku, and ensure it is running smoothly?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Issue.create!(
  title: "How to integrate third-party APIs in Rails?",
  description: "As a recent graduate of the LeWagon bootcamp, I am unsure of how to integrate third-party APIs in my Ruby on Rails application. I want to add features to my application by using APIs from external services, but I am not sure where to start or how to handle the data returned by the API. Can someone provide me with some guidance on how to integrate third-party APIs in a Ruby on Rails application, and how to effectively handle the data they return?",
  rating: 4,
  channel_id: Channel.first.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)
pp "Now adding pre-made responses"
pp "Adding responses to the first issue..."

Issue.create!(
  title: "Rails sort by column on multiple tables",
  description: "I'm attempting to do a SQL sort in rails by sorting on a column in multiple tables.
  Both Event and Featured models have a column called 'date'. An event can belong_to a Featured. I'd like to be able to join these two columns together and sort by this date column on both. So if the date of a Featured is 24/05/12 and the date of an Event is 23/05/12, then the Event date would display first. I'd prefer to do this in SQL (not using a Ruby sort). Thanks!",
  rating: 5,
  code_block: ".order('events.date ASC, featureds.date ASC')",
  channel_id: Channel.second.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "I would just use the Rails built in: link_to 'GOOGLE', 'http://www.google.com', target: '_blank', class: 'btn btn-large btn-primary'.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
content: "Both methods are valid and will give you a random record from the table, but there are some differences to consider. The first method you mentioned from Jamis Buck involves using a random ordering of the records, and then selecting the first record from that ordering. This approach can be slow for large tables, as it requires the database to sort all of the records before selecting the first one. However, it may be more precise if you want a truly random record, as it ensures that all records have an equal chance of being selected. The second method you found involves generating a random ID and then selecting the first record with an ID greater than or equal to that random ID. This approach is faster, as it only needs to look up a single record based on its ID. However, it may not be as precise, as there could be gaps in the ID sequence (e.g. if records were deleted), which could skew the distribution of selected records. In terms of efficiency, the second method is likely to be faster for large tables, but the first method may be more precise. Ultimately, the best approach will depend on your specific use case and performance requirements.",
rating: 4,
issue_id: Issue.last.id,
user_id: User.order(Arel.sql('RANDOM()')).first.id,
pinned: true
)

Message.create!(
  content: "Then your proposed solution is close to ideal :) I'd use 'SELECT MAX(id) FROM table_name' instead of the COUNT(*) as it will deal with deleted rows a bit better, otherwise, the rest is fine. In short, if 'good enough' is ok, then you just have to have a method that assumes a distribution close to what you actually have. If it's uniform and even as you've said, simple rand works great.",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: false
  )

pp "Rails 404"
Issue.create!(
  title: "How to redirect to a 404 in Rails?",
  description: "I'd like to 'fake' a 404 page in Rails. In PHP, I would just send a header with the error code as such: header('HTTP/1.0 404 Not Found'); How is that done with Rails?",
  rating: 5,
  channel_id: Channel.second.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "Don't render 404 yourself. Rails has this functionality built in - one of the many reasons to love Rails ❤️ ❤️ ❤️.

  If you want to show a 404 page, just create a render_404 method (or not_found as I called it) in ApplicationController.

  Something like:

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  ",
  rating: 4,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

pp "Rails add a link issue and messages"
Issue.create!(
  title: "Rails: How to add link_to with target_blank",
  description: "I'm attempting to do a SQL sort in rails by sorting on a column in multiple tables.
  Both Event and Featured models have a column called 'date'. An event can belong_to a Featured. I'd like to be able to join these two columns together and sort by this date column on both. So if the date of a Featured is 24/05/12 and the date of an Event is 23/05/12, then the Event date would display first. I'd prefer to do this in SQL (not using a Ruby sort). Thanks!",
  rating: 5,
  code_block: ".order('events.date ASC, featureds.date ASC')",
  channel_id: Channel.second.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)


pp "JS Caret"
Issue.create!(
  title: "javascript function to tell if caret is in first or last row of textarea",
  description: "I've seen this question asked and answered, but the answers are never applicable to my issue, meaning they don't really solve the issue, and they're old so it's possible new solutions exist.

  I have textareas that all start out with 1 row. User input causes the tetxareas to grow to fit content. I want the user to be able to move between textareas (they're stacked vertically) using the arrow keys. The issue is, I only want the UP ARROW to move to previous textarea if caret is in the first line. Same goes for DOWN ARROW/bottom line.",
  rating: 5,
  channel_id: Channel.all[-3].id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "I would: 1) Get caret position by selectionStart, 2) If the caret position = 0, move to previous textarea. 3) If the caret position = textLength, move to next textarea. 4) Execute the function when keyup",
  rating: 2,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

pp "JS arrays"
Issue.create!(
  title: "Basic question.. but, how do you select a random value form an array in JS",
  description: "How can I select a random value from this array using JavaScript?",
  code_block: "var myArray = ['January', 'February', 'March'];",
  rating: 4,
  channel_id: Channel.all[-3].id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id
)

Message.create!(
  content: "As a one-line: const randomElement = array[Math.floor(Math.random() * array.length)];",
  rating: Channel.second.id,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "If you've already got underscore or lodash included in your project you can use _.sample.",
  rating: 2,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "With ES6 you can use a find function. Something like: var item = ['A', 'B', 'C', 'D'].find((_, i, ar) => Math.random() < 1 / (ar.length - i));  ",
  rating: 3,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "~~ is much faster than Math.Floor(), so when it comes to performance optimization while producing output using UI elements, ~~ wins the game",
  rating: 3,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

Message.create!(
  content: "But if you know that the array is going to have millions of elements then you might want to reconsider between Bitwise Operator and Math.Floor(), as bitwise operators behave weirdly with large numbers. See below example explained with the output.

  var number = Math.floor(14444323231.2); // => 14444323231
  var number = 14444323231.2 | 0; // => 1559421343",
  rating: 3,
  issue_id: Issue.last.id,
  user_id: User.order(Arel.sql('RANDOM()')).first.id,
  pinned: true
)

pp "Created #{User.count} users."
pp "Created #{Issue.count} issues."
pp "Created #{Channel.count} channels."
pp "New seeds have been created. Long live the new seeds"
