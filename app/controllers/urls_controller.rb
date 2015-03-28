class UrlsController < ApplicationController
  def index
    if params[:sort] == "popularity"
      @urls = Url.order(popularity: :desc)
    else
      @urls = Url.order(created_at: :desc)
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_create_by(url_params)
    if @url.save
      flash[:success] = "shortened url of #{@url.long} is #{@url.short_url}"
      redirect_to urls_path
    else
      flash[:errors] = @url.errors.full_messages
      render :new
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:long)
  end
end
