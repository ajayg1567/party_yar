class Category < ApplicationRecord
	has_one_attached :banner
	extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :super_category
  has_many :sub_categories, dependent: :destroy
  has_many :add_ons
  belongs_to :occasion
end
