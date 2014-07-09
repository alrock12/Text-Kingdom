module GamesHelper
	def rating (game)
      game.experiences.average(:rating).to_f
  end

  def game_total_plays (game)
      game.experiences.count
  end
end