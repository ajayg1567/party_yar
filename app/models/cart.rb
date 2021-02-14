class Cart < ApplicationRecord
	has_many :items, dependent: :destroy

	def add_item(params)
		additional = {}
		if params["add_ons"].present?
			additional[:add_ons] = JSON.parse(params['add_ons'])
			additional[:add_ons].map{|m, count| additional[:add_ons].delete(m) if count <=0 }
		end
		additional[:cake_price_value] = params['cake_price_value'].to_f if params["cake_price_value"].present?
		additional[:product_upgrade_id] = params[:product_upgrade_id]
		additional[:pincode] = params[:pincode]
		additional[:shipping_method] = params[:delivery_details].split("shipping_method:")[1].present? ? params[:delivery_details].split("shipping_method:")[1] : nil
		if params["delivery_details"]
			delivery_details = params["delivery_details"].split(",")
			additional[:delivery_date] = delivery_details[0]
			additional[:delivery_time] = delivery_details[1]
			delivery_details = params["delivery_details"].split(",") 
		end
		additional[:extra_field_id] = params[:extra_field_id]  
		variation_id = (params[:variation_id].to_i > 0) ? params[:variation_id].to_i : nil
		self.items << Item.new(product_id: params[:product_id], additional: additional, product_variation_id: variation_id)
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
			if item.product_variation_id.present?
				price << Variation.find_by(id: item.product_variation_id).price.to_i
			else
				price << item.additional[:add_ons].map{|m, count| AddOn.find(m).price.to_i * count.to_i}.flatten.map(&:to_i) if item.additional[:add_ons].present?
				price << Product.find(item.product_id).price.to_i * (item.additional[:cake_price_value] || 1)
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
		items = self.items
		items.each do |item|
			if item.additional[:shipping_method].present?
				price <<  ShippingMethod.find_by_tag_name(item.additional[:shipping_method]).price
			end
		end
		price&.sum
	end
end
