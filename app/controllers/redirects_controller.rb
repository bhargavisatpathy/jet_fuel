class RedirectsController < ApplicationController
  def show
    @url = Url.find_by_short_id(params[:eid])
    redirect_to @url.long
  end
end
