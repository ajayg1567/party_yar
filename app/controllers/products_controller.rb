require 'constants'
require 'open-uri'
class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  layout 'frontend/application'

	def show
		@addons = AddOn.all
		@recomended_products = Product.all.order!('views DESC').take(8)
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
	  sm = ShippingMethod.find_by_tag_name(params[:sm_name]) if params[:sm_name].present?
	  sm = ShippingMethod.find_by_id(params[:sm_id]) if params[:sm_id].present?
	  timeslots = []
	  sm.time_slots.each do |ts|
		timeslots << {id: ts.id,from: ts.from.strftime("%I:%M %p"),to: ts.to.strftime("%I:%M %p") }
	  end
	  if params[:sm_id].present?
	  	render json: { timeslots: timeslots, name: sm.tag_name }, status: 200 
	  else
	  	render json: timeslots.to_json
	  end
	end

	def set_product
		@product = Product.friendly.find(params[:id])
		@product.update_column(:views, @product.views + 1)
	end
end