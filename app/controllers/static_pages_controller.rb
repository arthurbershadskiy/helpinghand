class StaticPagesController < ApplicationController
	def index
		@events = Event.all
		@hash = Gmaps4rails.build_markers(@events) do |event, marker|
		marker.lat event.latitude
		marker.lng event.longitude
		marker.infowindow event.name
		end
	end

end
