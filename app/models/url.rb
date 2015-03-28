class Url < ActiveRecord::Base
  validates :long, presence: true, format: { with: /\Ahttps?:\/{2}[a-zA-Z\d]+/,
                                            message: "invalid url" }

  def short_url
      ENV["short_base_url"] + Codec.encode(id)
  end

  def self.find_by_short_id(eid)
    if eid
      url = find(Codec.decode(eid))
      url.popularity += 1
      url.save
      url
    end
  end

end
