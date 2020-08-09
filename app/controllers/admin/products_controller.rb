class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :get_primary_data, only: [:new, :edit, :create, :update]
  layout 'admin'

  # GET /products
  # GET /products.json
  def index
    @shipping_methods = ShippingMethod.all.index_by(&:id)
    @sub_categories = SubCategory.all.index_by(&:id)
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def import
    @file = params[:product]['xls_file']
    sheet = Roo::Spreadsheet.open(@file.path)
    super_category_id = params[:product][:super_category_id]
    shipping_method_id = params[:product][:shipping_method_id]
    sub_category_id = params[:product][:sub_category_id]
    result = ImportProductJob.perform_async(sheet, super_category_id, shipping_method_id,sub_category_id)
    if result
      redirect_to admin_products_path
    else
      render 'import'
    end
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def get_primary_data
      @shipping_methods = ShippingMethod.all
      @sub_categories = SubCategory.all
      @super_categories = SuperCategory.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit!
      # params.require(:product).permit(:name, :description, :price, :day_delivery, :day_delivery_till, :shipping_method_ids => [], :super_category_id, :banner, :remove_banner :gallery_ => [], :quantity, extra_fields_attributes: [:id, :option_type, :option_value, :product_id], product_upgrades_attributes: [:id, :weight, :price, :thumbnail, :product_id] )
    end
end
