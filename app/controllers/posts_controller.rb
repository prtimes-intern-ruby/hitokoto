class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @posts = Post.all
  end

  def show
  end

  def create
    post = current_user.posts.new(post_params)
    post.category_id = params[:post][:category].to_i
    post.save
    redirect_to post_path(post) 
  end

  def destroy
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content, :image, :company_id, :release_id)
    end
end
