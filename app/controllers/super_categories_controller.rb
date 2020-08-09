class SuperCategoriesController < ApplicationController
  before_action :set_super_category, only: [:show]
  layout 'frontend/application'

  def method_name
    
  end

  def show
  	@products = @super_category.products.includes(:shipping_method)
    @sub_category = SubCategory.find_by_slug(params[:sub_category_id])
    @gift_types = GiftType.all
  end

  private
  def set_super_category
    @super_category = SuperCategory.friendly.find(params[:id])
  end
end