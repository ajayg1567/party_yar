class CartController < ApplicationController
	layout 'frontend/application'

	def add_to_cart
		current_cart.add_item(params)
		respond_to do |format|
			format.js
		end
	end

	def cart_addon
		current_cart.add_item(params)
		redirect_to :controller=>'checkout', :action=>'index'
	end
	
	def remove
		current_cart.remove_item(params[:item_id])
		respond_to do |format|
			format.js
		end
	end
end