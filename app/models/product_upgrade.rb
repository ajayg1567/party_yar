class ProductUpgrade < ApplicationRecord
    has_many_attached :gallery
    belongs_to :product
end
