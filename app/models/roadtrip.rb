class Roadtrip
  def self.valid_key?(key)
    if User.find_by(api_key: key)
      true
    else
      raise ActiveRecord::RecordNotFound, "No user found with the provided API key"
    end
  end
end