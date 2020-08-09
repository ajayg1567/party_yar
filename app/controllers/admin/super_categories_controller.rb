class Admin::SuperCategoriesController < ApplicationController
  before_action :set_super_category, only: [:show, :edit, :update, :destroy]
  layout 'admin'
  # GET /super_categories
  # GET /super_categories.json
  def index
    @super_categories = SuperCategory.all
  end

  # GET /super_categories/1
  # GET /super_categories/1.json
  def show
  end

  # GET /super_categories/new
  def new
    @super_category = SuperCategory.new
  end

  # GET /super_categories/1/edit
  def edit
  end

  # POST /super_categories
  # POST /super_categories.json
  def create
    @super_category = SuperCategory.new(super_category_params)

    respond_to do |format|
      if @super_category.save
        format.html { redirect_to admin_super_category_url(@super_category), notice: 'Super category was successfully created.' }
        format.json { render :show, status: :created, location: @super_category }
      else
        format.html { render :new }
        format.json { render json: @super_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_categories/1
  # PATCH/PUT /super_categories/1.json
  def update
    respond_to do |format|
      if @super_category.update(super_category_params)
        format.html { redirect_to admin_super_category_url(@super_category), notice: 'Super category was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_category }
      else
        format.html { render :edit }
        format.json { render json: @super_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_categories/1
  # DELETE /super_categories/1.json
  def destroy
    @super_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_super_categories_url, notice: 'Super category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_category
      @super_category = SuperCategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_category_params
      params.require(:super_category).permit(:name)
    end
end
