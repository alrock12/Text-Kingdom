module UsersHelper
  #for authoring

  def total_plays_of_author(user)
   user.games.joins(:experiences).
              group("experiences.game_id").
              count.
              values.
              inject(0,:+)
  end

  def avg_ratings_of_author(user)
    ratings_arr = user.games.joins(:experiences).group("experiences.game_id").average(:rating).values
    if ratings_arr == []
      return '---'
    else
      avg = (ratings_arr.inject(0, :+))/(ratings_arr.length)
      return avg.round(1)
    end
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

  def top_game_record(user)
    highest_rated_game = user.games[0]
    if !highest_rated_game.nil?
      user.games.each do |game|
       if avg_game_rating(game) > avg_game_rating(highest_rated_game)
         highest_rated_game = game
        end
      end
      return highest_rated_game
    else
      return none
    end
  end

  def num_games_played(user)
    user.experiences.uniq.count
  end

  def games_played(user)
    game_ids = Experience.where(user: user.id).pluck("game_id")
    return Game.where(:id => game_ids)
  end

  def authored_games(user)
    Game.where(user: user)
  end

end