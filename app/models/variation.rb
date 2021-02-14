class Variation < ApplicationRecord
	has_one_attached :thumbnail

	WEIGHT = ['Small - 1kg','Medium - 2kg', 'Large - 3kg', 'Extra Large - 4k']
	CATERGORY = ['Size', 'Weight']
end