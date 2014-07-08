class GamesController < ApplicationController

  #Not sure yet the way to add and create new games

   def new
     @game = Game.new
   end

   def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "Your game is live!"
      redirect_to @game
    else
      render 'new'
    end
   end

   def show
    @game = Game.find(params[:id])
   end

  def index
    #Game Hub page
    @game_newest = Game.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @game_week = #Game.#where("created_at >= :lastweek", 
                 # { lastweek: (Time.now - 7.days) }).
                  # joins(:experiences).
                  # group("experiences.game_id").
                  # order("count(experiences.game_id) DESC").
                  # paginate(page: params[:page], per_page: 10)

                 #Game.where("created_at >= :lastweek", { lastweek: (Time.now - 7.days) }).find_each do |game|


                 Game.joins(:experiences).
                 where("experiences.created_at < ?", (Time.now - 7.days) ).
                 group("experiences.game_id").
                  order("count(experiences.game_id) DESC").
                  paginate(page: params[:page], per_page: 10)
                 #Game.joins(:experiences).where("experiences.created_at < ?", (Time.now - 365.days) ).

    @game_year = Game.#where("created_at >= :lastyear", 
                  #{ lastyear: (Time.now - 365.days) }).
                  joins(:experiences).
                  where("experiences.created_at < ?", (Time.now - 365.days) ).
                  group("experiences.game_id").
                  order("count(experiences.game_id) DESC").
                  paginate(page: params[:page], per_page: 10) 
  end

  def show
    ##lead \game page
  end

  private
    def game_params
      params.require(:game).permit(:title, :link, :description, :genre)
    end
end