class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :user_id
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
