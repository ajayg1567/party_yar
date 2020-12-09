class SuperCategoriesController < ApplicationController
  before_action :set_super_category, only: [:show]
  layout 'frontend/application'

  def method_name
    
  end

  def show
    @id = params[:id] if params[:id].present?
    @sub_category_id = params[:sub_category_id] if params[:sub_category_id].present?
    @sub_category = SubCategory.find_by_id(params[:sub_category_id])
    @gift_types = SuperCategory.first
    @products = SubCategory.find_by(id: params[:sub_category_id])&.products if params[:sub_category_id].present?
    @products = Product.joins({sub_category: :category}).where(categories: {occasion_id: params[:occasion_id]}, sub_categories: {id: params[:sub_category_id]}) if params[:sub_category_id].present? && params[:occasion_id].present?
    @products = Product.joins({sub_category: :category}).where(products: {city: params[:city_name]}, sub_categories: {id: params[:sub_category_id]}) if params[:sub_category_id].present? && params[:city_name].present?
    @products = Product.joins({sub_category: :category}).where("products.price < ? AND sub_categories.id = ?",  params[:below], params[:sub_category_id]) if params[:sub_category_id].present? && params[:below].present?
    @products = Product.joins({sub_category: :category}).where("products.price > ? AND sub_categories.id = ?",  params[:above], params[:sub_category_id]) if params[:sub_category_id].present? && params[:above].present?
    @products = @super_category.products if params[:query].present?
  end

  private
  def set_super_category
    if params[:query].blank?
      @super_category = SuperCategory.friendly.find(params[:id])
    else
      @super_category = SuperCategory.where("slug ILIKE ?", params[:query]).take
    end 
  end
end