class SubCategory < ApplicationRecord
	has_one_attached :banner
	extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :category
  has_many :products
  has_many :add_ons
end