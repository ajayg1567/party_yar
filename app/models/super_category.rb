class SuperCategory < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

  include PgSearch::Model
	pg_search_scope :scope_search, against: [:name],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

	has_many :products
	has_many :categories, dependent: :destroy
end
