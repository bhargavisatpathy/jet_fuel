require 'rails_helper'

describe "anonymous user", type: :feature do
  include Capybara::DSL
  let(:url){ Url.create(long: "http://maps.google.com") }

  xit "can go to a page using short url" do
    visit "#{url.short_url}"
    # puts url.short_url
    # puts root_url
    # save_and_open_page
    expect(page).to have_content("maps")

  end

end
