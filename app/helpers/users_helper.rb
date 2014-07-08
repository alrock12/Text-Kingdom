module UsersHelper
  #for authoring

  def total_plays(user)
    sum = 0
    user.games.each do |game|
      sum += game.experiences.count
    end
    sum
  end

  def avg_ratings(user)
    sum = 0
    n = 0
    user.games.each do |game|
      game.experiences.each do |play|
        sum += play.rating 
        n += 1
      end
    end
    n != 0? avg = (sum/n).round(1): avg = 0.0  
  end



  def top_game(user)
    highest_rated_game = user.games[0]
    if !highest_rated_game.nil?
      user.games.each do |game|
       if avg_game_rating(game) > avg_game_rating(highest_rated_game)
         highest_rated_game = game
        end
      end
      return highest_rated_game.title
    else
      return '---'
    end
  end


  def num_games_played(user)
    user.experiences.uniq.count
  end


end