class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@array = []
		User.all.each do |user|
			place = Place.find(user.id)
			@array.push([user.email, place.lat, place.lng])
		end
		@arr_json = @array.to_json.html_safe  	
	end
end
