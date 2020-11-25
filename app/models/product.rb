class Product < ApplicationRecord
	has_one_attached :banner
	has_many_attached :gallery
	extend FriendlyId
  friendly_id :name, use: :slugged
	has_many :extra_fields, :dependent => :destroy
	has_many :variations, :dependent => :destroy
	has_many :product_upgrades,:dependent => :destroy
	accepts_nested_attributes_for :extra_fields, allow_destroy: true
	accepts_nested_attributes_for :variations, allow_destroy: true
	has_and_belongs_to_many :shipping_method
	belongs_to :sub_category
	belongs_to :super_category
	has_many :orders, :dependent => :destroy
	has_many :items, :dependent => :destroy
	ratyrate_rateable 'name'


	def self.find_by_gift_type(gift_type)
		category = Category.find_by_name(gift_type)
		sub_category = SubCategory.find_by(category_id: category.id)
		assigned_sub_categories = category.sub_categories
		products = Product.where(sub_category_id: sub_category&.id)
		{ assigned_sub_categories: assigned_sub_categories, 
			sub_category: sub_category, 
			products: products,
			cities:  products.select(:city).group(:city),
			prices_group: products.select(:price).group(:price).having("count(price) > 0 ").count
		}
	end

	def self.sort_by_price(params)
		price = params[:price].to_i
		gift_type = GiftType.find_by(id: params[:gift_type_id])
		category = Category.find_by_name(gift_type.name)
		sub_category = SubCategory.find_by(category_id: category.id)
		products = Product.where(sub_category_id: sub_category&.id)
		products.where('price >= ? and price < ?', price, price * 2)
	end

	def self.filter(params)
		
	end
end