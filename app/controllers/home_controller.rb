class HomeController < ApplicationController
	layout 'frontend/application'
	# add_breadcrumb "home", :root_path

  def index
  	if params[:query].present?
  		@super_categories = SuperCategory.scope_search(params[:query])
  	end
  	# redirect_to super_category_url(@super_categories[0]&.name&.downcase)
  	@categories = Category.includes(:sub_categories).uniq(&:name)
  	@sub_categories = SubCategory.all
		@gift_types = GiftType.last(9)
		# add_breadcrumb "index", index_path
  end
end
