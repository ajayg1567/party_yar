module SuperCategoriesHelper
	def product_review_rating(product)

		reviews = product.reviews
		if reviews.present?
	      star_5 = reviews.where(stars: 5).count
	      star_4 = reviews.where(stars: 4).count
	      star_3 = reviews.where(stars: 3).count
	      star_2 = reviews.where(stars: 2).count
	      star_1 = reviews.where(stars: 1).count
	      star_count = reviews.count
	      star_rating = ((star_5*(5) + star_4*(4) + star_3*(3) + star_2*(2) + star_1*(1))/ star_count.to_f).round(2)
	      return star_rating = star_rating&.to_f
		end
	end
end
