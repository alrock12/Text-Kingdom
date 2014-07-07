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
      ##users
      username = Faker::Internet.user_name + (n+1000).to_s
      name = Faker::Name.name.split(' ')
      email = Faker::Internet.email
      user = User.create!(first_name: name[0],
                          last_name: name[1],
                          username: username,
                          email: email,
                          password: 'password',
                          password_confirmation: 'password')

      ##user games
      15.times do |m|
        title = Faker::Commerce.color.capitalize + ' ' +  Faker::Address.country
        link = Faker::Internet.url('textkingdom.com/games')
        description = Faker::Lorem.paragraph
        genres = ['mystery', 'dungeon', 'fantasy']
        genre = genres[(m % 3)]
        user.games.create!(title: title,
                     link: link,
                     description: description,
                     genre: genre)
      end
    end
  end
end
