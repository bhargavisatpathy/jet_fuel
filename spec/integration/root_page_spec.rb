require 'rails_helper'

describe "anonymous user", type: :feature do

  it "can visit the root page" do
    visit root_url
    expect(page).to have_button("new")
  end

  it "can see the list of urls" do
    long_url = "http://hubba-hubba-hubstub.herokuapp.com"
    another_long_url = "http://maps.google.com"
    visit new_url_path
    fill_in "url[long]", with: long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("#{long_url}")
    visit new_url_path
    fill_in "url[long]", with: another_long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("#{another_long_url}")
  end

  xit "can see the list of urls sorted by popularity" do
    long_url = "http://hubba-hubba-hubstub.herokuapp.com"
    another_long_url = "http://maps.google.com"
    visit new_url_path
    fill_in "url[long]", with: long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("#{long_url}")
    visit new_url_path
    fill_in "url[long]", with: another_long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("#{another_long_url}")
  end

  it "can see the list of urls sorted by age" do
    long_url = "http://hubba-hubba-hubstub.herokuapp.com"
    another_long_url = "http://maps.google.com"
    visit new_url_path
    fill_in "url[long]", with: long_url
    click_link_or_button("Shorten")
    visit new_url_path
    fill_in "url[long]", with: another_long_url
    click_link_or_button("Shorten")
    expect(page).to have_content("List of urls")
    within("li:first") do
      expect(page).to have_content("#{another_long_url}")
    end
    within("li:last") do
      expect(page).to have_content("#{long_url}")
    end
  end
end
