class Admin::GiftTypesController < ApplicationController
  layout 'admin'
  before_action :set_gift_type, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:edit, :create, :update, :new]

  # GET /admin/gift_types
  # GET /admin/gift_types.json
  def index
    @gift_types = GiftType.all
  end

  # GET /admin/gift_types/1
  # GET /admin/gift_types/1.json
  def show
  end

  # GET /admin/gift_types/new
  def new
    @gift_type = GiftType.new
  end

  # GET /admin/gift_types/1/edit
  def edit
  end

  # POST /admin/gift_types
  # POST /admin/gift_types.json
  def create
    @gift_type = GiftType.new(gift_type_params)

    respond_to do |format|
      if @gift_type.save
        format.html { redirect_to admin_gift_type_url(@gift_type), notice: 'Gift type was successfully created.' }
        format.json { render :show, status: :created, location: @gift_type }
      else
        format.html { render :new }
        format.json { render json: @gift_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/gift_types/1
  # PATCH/PUT /admin/gift_types/1.json
  def update
    respond_to do |format|
      if @gift_type.update(gift_type_params)
        format.html { redirect_to admin_gift_type_url(@gift_type), notice: 'Gift type was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift_type }
      else
        format.html { render :edit }
        format.json { render json: @gift_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/gift_types/1
  # DELETE /admin/gift_types/1.json
  def destroy
    @gift_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_gift_types_url, notice: 'Gift type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift_type
      @gift_type = GiftType.friendly.find(params[:id])
    end

    def set_categories
      @categories = Category.all.uniq(&:name).pluck(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_type_params
      params.require(:gift_type).permit(:name, :icon)
    end
end
