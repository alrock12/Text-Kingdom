class GamesController < ApplicationController

  #Not sure yet the way to add and create new games

  # def new
  #   @game = Game.new
  # end

  def index
    #Game Hub page
    @game_newest = Game.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @game_week = Game.games_week.paginate(page: params[:page], per_page: 10)
    @game_year = Game.games_year.paginate(page: params[:page], per_page: 10) 
  end

  def show
    ##lead \game page
  end

  private
    def user_params
      #pull parameters in private
    end
end