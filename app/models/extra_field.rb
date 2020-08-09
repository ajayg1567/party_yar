class ExtraField < ApplicationRecord
	belongs_to :product
	OPTIONS=['Boolean', 'TextArea']
end
