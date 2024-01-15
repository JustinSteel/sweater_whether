class Forecast < ApplicationRecord
  def self.location_present(location)
    if location.nil? || location.empty?
      raise ActiveRecord::StatementInvalid, "Location can not be empty"
    else
      location
    end
  end
end
