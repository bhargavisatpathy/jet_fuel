require 'rails_helper'

describe "anonymous user", type: :feature do

  it "can visit the shorten url page" do
    visit root_url
    expect(page).to have_button("new")
    click_link_or_button("new")
    expect(page).to have_button("Shorten")
  end

  it "can see the short url" do
    visit new_url_path
    long_url = "http://hubba-hubba-hubstub.herokuapp.com"
    fill_in "url[long]", with: long_url
    click_link_or_button("Shorten")
    expect(current_path).to eq(urls_path)
    expect(page).to have_content("shortened url of #{long_url}")
  end

end
