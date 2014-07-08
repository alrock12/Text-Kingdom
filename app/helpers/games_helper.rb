module GamesHelper
	def rating (game)
      game.experiences.average(:rating).to_f
  end
end