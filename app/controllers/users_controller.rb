class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    ##how to create a user
  end

  def show
    # @user = User.first
    ##lead to user home page
  end

  def index
    # @users = User.all
  end

  def destroy
    ##how to destroy user

    redirect_to users_path
  end

  private
    def user_params
      #pull parameters in private
    end
end