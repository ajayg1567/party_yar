class Admin::AddOnsController < Admin::ApplicationController
  before_action :set_add_on, only: [:show, :edit, :update, :destroy]
  before_action :get_primary_data, only: [:new, :edit, :create, :update]

    def index
        @add_ons = AddOn.all
    end

    def new
      @add_on = AddOn.new
    end

    def create
      @add_on = AddOn.create(add_on_params)
      if @add_on.save
        respond_to do |format|
         format.html { redirect_to admin_add_on_url(@add_on), notice: 'Add On was successfully created.' }
         format.json { render :show, status: :created, location: @add_on }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @add_on.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
    end

    def edit
    end

    def update
      if @add_on.update(add_on_params)
        respond_to do |format|
        format.html { redirect_to admin_add_on_url(@add_on), notice: 'Add On was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_on }
        end
      else
        respond_to do |format|
        format.html { render :edit }
        format.json { render json: @add_on.errors, status: :unprocessable_entity }
      end
      end
    end

    def destroy
      begin
      if @add_on.destroy
      respond_to do |format|
        format.html { redirect_to admin_add_ons_url, notice: 'Add On was successfully deleted.' }
        format.json { head :no_content }
      end
     end
     rescue Exception => e
      flash[:notice] = e.to_s
     end
    end


private

  def add_on_params
    params.require(:add_on).permit(:name,:price,:sub_category_id,:category_id,:gallery)
  end

  def set_add_on
    @add_on = AddOn.find(params[:id])
  end

  def get_primary_data
    @shipping_methods = ShippingMethod.all
    @sub_categories = SubCategory.all
    @categories = Category.all
  end


end
