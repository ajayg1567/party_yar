class Cart < ApplicationRecord
	has_many :items, dependent: :destroy

	def add_item(params)
		additional = {}
		additional[:add_on_ids] = params[:add_on_ids].split(",") if params["add_on_ids"]
		additional[:product_upgrade_id] = params[:product_upgrade_id]
		additional[:pincode] = params[:pincode]
		if params["delivery_details"]
			delivery_details = params["delivery_details"].split(",")
			additional[:delivery_date] = delivery_details[0]
			additional[:delivery_time] = delivery_details[1]
			delivery_details = params["delivery_details"].split(",") 
		end
		additional[:extra_field_id] = params[:extra_field_id]  	
		self.items << Item.new(product_id: params[:product_id], additional: additional)
		self.save
		return
	end

	def remove_item(item_id)
	  item = items.where('id = ?', item_id).first.delete
	  self
	  return
	end
	
	def total_price
		price = []
		new_price = []
		items.each do |item|
			if item.additional[:product_upgrade_id].present?
				price << ProductUpgrade.find(item.additional[:product_upgrade_id]).price.to_i
			elsif item.additional[:add_on_ids].present?	
				price << item.additional[:add_on_ids].map{|m| AddOn.where(:id=> m)}.flatten.map{|n| n.price.to_i}.flatten.map(&:to_i)
				price << Product.find(item.product_id).price.to_i
			else
				price << Product.find(item.product_id).price.to_i
			end
		end
		# @products = Product.where(id: items.pluck(:product_id) )
    # @products.to_a.sum(&:price).to_i
    price.flatten.sum
	end

	def total_amount_with_delivery
		shipping_price +  total_price
	end

	def shipping_price
		price = []
		products = Product.includes(:shipping_method).where(id: items.pluck(:product_id))
		products.each do |product|
			price << product.shipping_method.first.price.to_i
		end
		price.sum
	end
end
