class Item < ApplicationRecord
	serialize :additional, Hash
	belongs_to :product
	has_one :address
end
