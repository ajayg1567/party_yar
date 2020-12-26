class Address < ApplicationRecord
  
  validates_format_of :mobile, :with =>  /\d[0-9]\)*\z/ , :alert => "Only positive number without spaces are allowedin phone number"
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, :alert => "Email format is invalid!" } 

  belongs_to :user
  belongs_to :item

  def self.full_address(address_id)
    order = Address.find address_id
    "#{order.address_line1}, #{order.city}, #{order.pincode}"
  end
end
