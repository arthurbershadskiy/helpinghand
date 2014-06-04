class Event < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	belongs_to :user
	has_many :participations
	has_many :users, through: :participations
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode
end
