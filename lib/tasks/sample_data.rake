namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: 'Amy',
                 last_name: 'Rock',
                 username: 'alrock',
                 email: 'lilrockygril@msn.com' ,
                 password: 'foobarfoo',
                 password_confirmation: 'foobarfoo')
    99.times do |n|
      username = "example-#{(n+1).to_s}"
      name = Faker::Name.name.split(' ')
      email = Faker::Internet.email
      User.create!(first_name: name[0],
             last_name: name[1],
             username: username,
             email: email,
             password: 'password',
             password_confirmation: 'password')
    end
  end
end
