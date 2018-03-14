SOURCE = [ Faker::Seinfeld, Faker::SiliconValley, Faker::StarWars, Faker::HarryPotter ]

def create_messages(u)
  u.tweets.destroy_all
  puts "Creating tweets"
  20.times do
    putc '.'
    u.tweets.create!(
      message: SOURCE.sample.quote,
      created_at: Faker::Date.between(2.months.ago, Time.now)
    )
  end
end


User.destroy_all

u = User.create!(
  first_name: "maria",
  last_name:  "O'vianello",
  email: 'joe@objo.com',
  password: '12345678',
  password_confirmation: '12345678',
  username: "objo",
  bio: "Lorem ipsum dolnthor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  city: "Westerville",
  state: "Ohio",
)

create_messages(u)

20.times do

  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'dont care',
    password_confirmation: 'dont care',
    username: Faker::Internet.user_name(5..10),
    bio: Faker::Lorem.sentences(4).join(" "),
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
  )

  create_messages(u)
end

puts "done"
