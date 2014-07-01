class GamesController < ApplicationController

  #Not sure yet the way to add and create new games

  # def new
  #   @game = Game.new
  # end

  def index

    #Game Hub page
    @games = Game.all
    @user = User.first
  end


  def show
    ##lead \game page
  end

  private
    def user_params
      #pull parameters in private
    end
end