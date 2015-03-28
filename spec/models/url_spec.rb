require 'rails_helper'

RSpec.describe Url, type: :model do

  it "is valid" do
    url = create(:url)
    expect(url).to be_valid
  end

  it "is invalid without a long url" do
    url = create(:url)
    url.long = nil
    expect(url).to be_invalid
  end

  it "is invalid without a protocol prefix" do
    url = create(:url)
    url.long = "www.gmail.com"
    expect(url).to be_invalid
  end
end
