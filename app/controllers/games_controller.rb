class GamesController < ApplicationController

  #Not sure yet the way to add and create new games

  # def new
  #   @game = Game.new
  # end

  def index
    #Game Hub page
    #@game_newest = Game.order(created_at: :desc)
    #@game_week = Game.where("created_at >= :lastweek", { lastweek: (Time.now - 7.days) }).joins(:experiences).group("experiences.user_id").order("count(experiences.user_id) DESC").paginate(page: params[:page], per_page: 10)
    #@game_year = Game.where("created_at >= :lastyear", { lastyear: (Time.now - 365.days) }).joins(:experiences).group("experiences.user_id").order("count(experiences.user_id) DESC").paginate(page: params[:page], per_page: 10) 
  end

  def show
    ##lead \game page
  end

  private
    def user_params
      #pull parameters in private
    end
end