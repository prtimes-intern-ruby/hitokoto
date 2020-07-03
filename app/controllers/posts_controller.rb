class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    post = current_user.posts.new(post_params)
    post.category_id = params[:post][:category].to_i
    if post.save
      redirect_to post_path(post)
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def timeline
    posts = current_user.posts
    current_user.followings.each { |following| posts += following.posts }
    @posts = posts.page(params[:page]).per(20).order(created_at: :desc)
  end

  def category
    @category = Category.find_by(name: params[:name])
    @posts = @category.posts.page(params[:page]).per(20).order(created_at: :desc)
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content, :image, :company_id, :release_id)
    end
end
