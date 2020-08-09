class GiftTypesController < ApplicationController
  layout 'frontend/application'
  before_action :set_gift_type, only: :show

  def show
  	@products = Product.find_by_gift_type(@gift_type.name)
  	# @filter_prices = @products.select(:price).group(:price).having("count(price) > 0").count
  	@occasions = Occasion.all
  	@gift_types = GiftType.all
  end

  def sorting
  	if params[:price].present?
  		@products = Product.sort_by_price(params)
  	else
  		@products = Product.filter(params)
  	end
  end

  private
    def set_gift_type
      @gift_type = GiftType.friendly.find(params[:id])
    end
end
