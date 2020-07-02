class HomeController < ApplicationController
  require "net/http"
  def index
    if params[:page]
      page_number = params[:page]
      set_pr_index(page_number)
    else
      page_number = "1"
      set_pr_index(page_number)
    end
  end

  def show
    company_id = params[:company_id]
    release_id = params[:release_id]
    uri = URI.parse("https://hackathon.stg-prtimes.net/detail/#{company_id}/#{release_id}?token=e7zCG8N0sl5y")
    json = Net::HTTP.get(uri)
    @result = JSON.parse(json)["data"]
    @json = JSON.parse(json)
  end

  private
    def set_pr_index(page_number)
      uri = URI.parse("https://hackathon.stg-prtimes.net/list/#{page_number}?token=e7zCG8N0sl5y")
      json = Net::HTTP.get(uri)
      @result = JSON.parse(json)["data"]
    end
end
