module GamesHelper
	def rating (game)
      game.experiences.average(:rating).to_f.round(1)
  end

  def plays(game)
    game.experiences.count
  end

  def game_total_plays (game)
      game.experiences.count
  end
end