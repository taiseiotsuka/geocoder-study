class PlacesController < ApplicationController
	def create
		@place = Place.find_by(user_id: current_user.id)
		if (@place)
			respond_to do |format|
				if @place.update(place_params)
					format.json { render json: { success: 'success' } }
				else
					format.json { render json: @place.errors, status: :unprocessable_entity }
				end
			end
		else
			@place = Place.new(place_params)
			respond_to do |format|
				if @place.save
					format.json { render json: { success: 'success' } }
				else
					format.json { render json: @place.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	def place_params
		params.require(:place).permit(:lat, :lng).merge(user_id: current_user.id)
	end
end
