class AddOn < ApplicationRecord
  has_one_attached :gallery
  belongs_to :sub_category
  belongs_to :category
end
