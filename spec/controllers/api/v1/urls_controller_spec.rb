require 'rails_helper'

RSpec.describe Api::V1::UrlsController, type: :controller do

  it "can shorten a url" do
    post :create, format: :json, url: { long: 'http://jumpstartlab.com' }

    response_hash = JSON.parse(response.body)
    expect(response).to have_http_status(201)
    puts response_hash
    expect(response_hash['url']['short']).to start_with('http://www.example.com/')
  end
end
