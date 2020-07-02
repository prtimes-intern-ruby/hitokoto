class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    posts = current_user.posts
    current_user.followings.each { |following| posts += following.posts }
    @posts = posts.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
  end

  def create
    post = current_user.posts.new(post_params)
    post.category_id = params[:post][:category].to_i
    if post.save
      redirect_to post_path(post) 
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content, :image, :company_id, :release_id)
    end
end
