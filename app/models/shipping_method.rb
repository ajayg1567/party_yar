class ShippingMethod < ApplicationRecord
	has_many :time_slots, dependent: :destroy
	has_and_belongs_to_many :products
	accepts_nested_attributes_for :time_slots, allow_destroy: true, reject_if: :reject_time_slots

	def reject_time_slots(attributes)
      attributes.blank?
    end
end
