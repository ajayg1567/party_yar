class CheckoutController < ApplicationController
	before_action :authenticate_user!
	
	layout 'frontend/application'

	def index
		# @product = Product.last
		# @address = Address.new
		#@product_id = Product.where(:id=> params["product_id"])
		# delivery_details = params["delivery_details"].split(",")
		# @delivery_date = delivery_details[0]
		# @delivery_time = delivery_details[1]
		# @delivery_type = delivery_details[2]
		# @add_on_price = params["total_price"].to_i
		
		# if params["add_on_ids"]
		# 	add_on_id = params["add_on_ids"].split(",") 
		# 	@add_on_products = AddOn.where(:id=> add_on_id) 		
		# end
	end

	def update_delivery	
		@item = Item.find params[:item_id]
		@item.additional[:delivery_date] = params[:delivery_date]
		@item.additional[:delivery_time] = params[:slot_time]
		@item.additional[:shipping_method] = ShippingMethod.find_by(id: params[:sm_id]).tag_name
		@item.save

		sm_price = ShippingMethod.find_by(id: params[:sm_id]).price
	end

	def update_add_ons
		item = Item.find params[:item_id]
		item.additional[:add_ons][params[:add_on_id]] = params[:add_on_count]
		item.save
		respond_to do |format|
			format.js
		end
	end

	def remove_add_on
		item = Item.find params[:item_id]
		item.additional[:add_ons].map{|m, count| item.additional[:add_ons].delete(m) if params[:add_on_id] == m}
		item.save
		respond_to do |format|
			format.js
		end
	end

	def change_order_details
		item = Item.find_by(id: params[:item_id]).additional 
		shipping_method = ShippingMethod.find(Product.find_by(id: params[:id]).shipping_method_ids)
		render json: { shipping_method: shipping_method, item: item }, status: 200
	end
	
end