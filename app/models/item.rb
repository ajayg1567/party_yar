class Item < ApplicationRecord
	serialize :additional, Hash
	belongs_to :product
	has_one :address

	def price
		product.price.to_i * (self.additional[:cake_price_value] || 1)
	end
end
