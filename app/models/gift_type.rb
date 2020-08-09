class GiftType < ApplicationRecord
	has_one_attached :icon
	extend FriendlyId
  friendly_id :name, use: :slugged

  validate :icon?

  private

  def icon?
  	unless icon.attached?
  		errors.add(:base, "Icon can't be empty")
  	end
  end
end