class Address < ApplicationRecord
  belongs_to :user
  belongs_to :item

  def self.full_address(address_id)
    order = Address.find address_id
    "#{order.address_line1}, #{order.city}, #{order.pincode}"
  end
end
