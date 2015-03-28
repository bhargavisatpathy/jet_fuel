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
    expect(page).to have_content(long_url)
    visit new_url_path
    fill_in "url[long]", with: another_long_url
    click_link_or_button("Shorten")
    expect(page).to have_content(another_long_url)
  end

  it "can see the list of urls sorted by popularity" do
    url = create(:url, long: "http://www.gmail.com", popularity: 3)
    url1 = create(:url)
    visit root_path
    within("tr:first") do
      expect(page).to have_content(url1.long)
    end
    click_link_or_button("by popularity")
    within("tr:first") do
      expect(page).to have_content(url.long)
    end
    within("tr:last") do
      expect(page).to have_content(url1.long)
    end
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
    expect(page).to have_content("List Of URLs")
    within("tr:first") do
      expect(page).to have_content(another_long_url)
    end
    within("tr:last") do
      expect(page).to have_content(long_url)
    end
  end

  it "can visit to statistics page" do
    long_url = "http://maps.google.com"
    visit new_url_path
    fill_in "url[long]", with: long_url
    click_link_or_button("Shorten")
    click_link_or_button(long_url)
    expect(page).to have_content(long_url)
    expect(page).to have_content("Short Alias:")
    expect(page).to have_content("Visits:")
    expect(page).to have_content("Created At:")
  end
end
