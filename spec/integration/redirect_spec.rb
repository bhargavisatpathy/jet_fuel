require 'rails_helper'

describe "anonymous user", type: :feature do

  xit "can go to a page using short url" do
    url = create(:url)
    visit "#{url.short_url}"
    expect(page).to have_content("maps")

  end

end
