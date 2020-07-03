class HomeController < ApplicationController
  before_action :authenticate_user!
  require "net/http"
  def top
    @categories = Category.all
    soaring_range = Date.yesterday.beginning_of_day..Date.today.end_of_day
    @soarings = Post.find(Favorite.where(created_at: soaring_range).group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    ranking_range = 7.day.ago.beginning_of_day..Date.today.end_of_day
    @rankings = Post.find(Favorite.where(created_at: ranking_range).group(:post_id).order('count(post_id) desc').limit(20).pluck(:post_id))
    @latest = Post.order(created_at: :desc).limit(20)
  end

  def index
    set_category_id
    if params[:page]
      @page_number = params[:page]
      set_pr_index(@page_number, @category_id)
    else
      @page_number = "1"
      set_pr_index(@page_number, @category_id)
    end
  end

  def show
    company_id = params[:company_id]
    release_id = params[:release_id]
    uri = URI.parse("https://hackathon.stg-prtimes.net/detail/#{company_id}/#{release_id}?token=e7zCG8N0sl5y")
    json = Net::HTTP.get(uri)
    @result = JSON.parse(json)["data"]
    @json = JSON.parse(json)
    puts @result
  end

  private
    def set_category_id
      if params[:category_id] == nil || params[:category_id] == "41"
        @category_id = "41"
      elsif params[:category_id] == "43"
        @category_id = "43"
      end
    end

    def set_pr_index(page_number, category_id)
      uri = URI.parse("https://hackathon.stg-prtimes.net/category_release/#{category_id}/#{page_number}?token=e7zCG8N0sl5y")
      json = Net::HTTP.get(uri)
      @result = JSON.parse(json)["data"]
    end
end
