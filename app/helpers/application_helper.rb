module ApplicationHelper
  #average rating of a game

    def avg_game_rating(game)
      sum = 0
      n = 0
      game.experiences.each do |play|
        play.rating += sum
        n += 1
      end
      n != 0 ? avg = (sum/n).round(1) : avg = 0.0
    end




end

