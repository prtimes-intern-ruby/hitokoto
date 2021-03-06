class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:user_id])
  end

  def followings
    @user = User.find(params[:user_id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :description, :profile_image)
    end
end
