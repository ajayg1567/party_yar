module SuperCategoriesHelper
	def product_review_rating(product)

		reviews = product.reviews
		return reviews.pluck(:stars).sum/(reviews.count).to_f
	end
end
