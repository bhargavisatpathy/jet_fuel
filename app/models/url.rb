class Url < ActiveRecord::Base
  validates :url, presence: true

  def short_url
      ENV["short_base_url"] + Codec.encode(id)
  end

end
