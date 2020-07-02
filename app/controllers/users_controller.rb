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
end
