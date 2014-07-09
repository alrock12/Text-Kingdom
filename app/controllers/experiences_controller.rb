class ExperiencesController < ApplicationController

	def create
	    @experience = Experience.new(experience_params)
	    if @experience.save
	      flash[:success] = "Thanks for playing!"
	      redirect_to @experience.game
	    else
	      flash[:failure] = "Save Failed. Try again."
	      redirect_to @experience.game
	    end
    end

private

    def experience_params
      params.require(:experience).permit(:user, :game, :rating, :progress)
    end
end