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

      game_num = rand(15)
      (game_num).times do |m|
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

      ##user experiences/plays
      games_available = Game.count

      exp_num = rand(10)
      (exp_num).times do |i|
        rating = rand(10)
        progress = rand(100)
        game = rand(games_available)
        user.experiences.create!(game_id: game,
                                 rating: rating,
                                 progress: progress)
      end
    end
  end
end
