class Variation < ApplicationRecord
	has_one_attached :thumbnail

	SIZE=['Small', 'Medium', 'Large']
end