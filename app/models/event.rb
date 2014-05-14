class Event < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	belongs_to :user
	has_many :participations
	has_many :volunteers, through: :participations
end
