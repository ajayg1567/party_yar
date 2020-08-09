require 'constants'
require 'open-uri'
class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  layout 'frontend/application'

	def show
		@addons = AddOn.all
	end

	def get_location
		api_url = ExternalApiUrl::POSTAL_LOCATION_API + params[:pincode]
		response = open(api_url).read
		data = JSON.parse(response)
		render json: {
			district: data["PostOffice"][0]["District"], 
			state: data["PostOffice"][0]["State"]
		}
	end
	def get_time_slots
	  product = params[:product_id]
	  sm = ShippingMethod.find_by_tag_name(params[:sm_name])
	  timeslots = []
	  sm.time_slots.each do |ts|
		timeslots << {id: ts.id,from: ts.from.strftime("%I:%M %p"),to: ts.to.strftime("%I:%M %p") }
	  end
	  render json: timeslots.to_json
	end

	def set_product
		@product = Product.friendly.find(params[:id])
	end
end