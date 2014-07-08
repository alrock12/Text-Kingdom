module GamesHelper
	def rating (game)
      sum = 0
      count = 0
      game.experiences.each do |experience|
        sum += experience.rating
        count += 1
      end

      if count == 0
      	return 0
      else
      	return sum.to_f / count
      end
    end
end