require 'rails_helper'

describe "anonymous user", type: :feature do
  include Capybara::DSL

  it "can visit the url input page" do
    visit root_url

    expect(page).to have_button("Shorten")
  end

  it "can see the short url" do
    visit root_url
    long_url = "http://hubba-hubba-hubstub.herokuapp.com"
    fill_in "url[url]", with: long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("your short url of #{long_url} is ")
  end

  
end
