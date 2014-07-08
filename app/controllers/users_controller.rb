class UsersController < ApplicationController
  before_action :signed_in_user,  except: [:new, :create]
  before_action :correct_user,      only: [:edit, :update]
  before_action :update_ranks,      only: [:index]
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Text Kingdom"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @games_played = games_played(@user)
  end

  def index
    @author_table = @ranked_auths.paginate(page: params[:page], per_page: 10)
    @player_table = @ranked_plays.paginate(page: params[:page], per_page: 10)
  end

  # def destroy
  #   how to destroy user

  #   redirect_to users_path
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #could be optimized?
    def update_ranks
      # @ranked_auths = User.author_plays
      ranked_auths = User.all.to_a.sort_by! { |user| total_plays_of_author(user) }
      @ranked_auths = ranked_auths.reverse
      @ranked_plays = User.user_plays 
    end

end