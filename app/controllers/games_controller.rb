class GamesController < ApplicationController

  #Not sure yet the way to add and create new games

   def new
     @game = Game.new
   end

   def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      flash[:success] = "Your game is live!"
      redirect_to @game
    else
      render 'new'
    end
   end

   def show
    @game = Game.find(4)
   end

  def index
    #Game Hub page
    @game_newest = Game.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @game_week = Game.games_week.paginate(page: params[:page], per_page: 10)
    @game_year = Game.games_year.paginate(page: params[:page], per_page: 10) 
  end

  private
    def game_params
      params.require(:game).permit(:title, :link, :description, :genre)
    end
end