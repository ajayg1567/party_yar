class CheckoutController < ApplicationController
	before_action :authenticate_user!
	
	layout 'frontend/application'

	def index
		@product = Product.last
		@address = Address.new
		#@product_id = Product.where(:id=> params["product_id"])
		# delivery_details = params["delivery_details"].split(",")
		# @delivery_date = delivery_details[0]
		# @delivery_time = delivery_details[1]
		# @delivery_type = delivery_details[2]
		@add_on_price = params["total_price"].to_i
		
		# if params["add_on_ids"]
		# 	add_on_id = params["add_on_ids"].split(",") 
		# 	@add_on_products = AddOn.where(:id=> add_on_id) 		
		# end
	end

	def update_delivery		
		@item = Item.find params[:item_id]
		@item.additional[:delivery_date] = params[:delivery_date]
		@item.additional[:delivery_time] = params[:slot_time]
		@item.save
		sm_price = ShippingMethod.select{|m| m.tag_name.downcase == params[:sm_name].downcase}
		# @product = Product.find params[:product_id]
		# @product.shipping_price = sm_price
		# @product.save			
	end
end