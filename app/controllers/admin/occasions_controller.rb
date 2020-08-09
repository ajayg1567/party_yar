class Admin::OccasionsController < ApplicationController
  before_action :set_occasion, only: [:edit, :update, :destroy]
  layout 'admin'

  def index
    @occasions = Occasion.all
  end

  def new
    @occasion = Occasion.new
  end

  def edit
  end

  def create
    @occasion = Occasion.new(occasion_params)

    respond_to do |format|
      if @occasion.save
        format.html { redirect_to admin_occasions_url, notice: 'Occasion was successfully created.' }
        format.json { render :show, status: :created, location: @occasion }
      else
        format.html { render :new }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @occasion.update(occasion_params)
        format.html { redirect_to admin_occasions_url, notice: 'Occasion was successfully updated.' }
        format.json { render :show, status: :ok, location: @occasion }
      else
        format.html { render :edit }
        format.json { render json: @occasion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @occasion.destroy
    respond_to do |format|
      format.html { redirect_to admin_occasions_url, notice: 'Occasion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_occasion
      @occasion = Occasion.friendly.find(params[:id])
    end

    def occasion_params
      params.require(:occasion).permit(:name, :slug)
    end
end
