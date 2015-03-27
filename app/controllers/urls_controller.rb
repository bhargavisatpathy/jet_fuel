class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_create_by(url_params)
    if @url.save
      redirect_to url_path(@url)
    else
      render :new
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end
end
