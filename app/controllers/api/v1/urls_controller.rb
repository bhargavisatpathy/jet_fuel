class Api::V1::UrlsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def create
    @url = Url.find_or_create_by(url_params)
    if @url.save
      response = { url: { long: @url.long, short: @url.short_url }, success: true }
      render json: response, status: 201
    else
      response = { success: false, message: "#{@url.errors.full_messages}" }
      render json: response, status: 500
    end
  end

  private

  def url_params
    params.require(:url).permit(:long)
  end
end
