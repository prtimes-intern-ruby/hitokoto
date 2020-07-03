class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
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

  private
    def post_params
      params.require(:post).permit(:title, :content, :image, :company_id, :release_id)
    end
end
