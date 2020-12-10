class OrdersController < ApplicationController
  layout 'frontend/application'
  
  skip_before_action :verify_authenticity_token
  def purchase_status
    begin
      @order = Order.process_razorpayment(payment_params, current_cart)
      flash[:notice] = "Order confirmed"
      redirect_to my_orders_path
    rescue Exception => e
      flash[:alert] = "Unable to process payment." + e.to_s
      redirect_to root_path
    end
  end

  def show
    @order = Order.find_by_id(params[:id])

  end
  
  def index
    @orders = User.last.orders
    # @orders = Order.filter(filter_params).page(params[:page]).per(20)
   # @product_upgrades = ProductUpgrade.all.index_by(&:id)
    @products = Product.where(id: @orders.pluck(:product_id)).index_by(&:id)
    
  end

  def refund
    payment_id = Order.find_by_id(params[:id]).payment_id
    @order = Order.process_refund(payment_id)
    redirect_to :action => "show", :id => @order.id
  end

  def reviews
    @product = Product.find_by(id: params[:id])
  end
  def add_reviews
    begin
      review = Review.create!(user_id: current_user.id, title: params[:title], content: params[:content], stars: params[:stars], product_id: params[:product_id])
      review.save!
      flash[:success] = "Review is Added!" 
    rescue => e
      flash[:danger] = "Something is wrong!" 
    end
  end

  private
    def payment_params
      p = params.permit(:payment_id, :user_id, :price, :razorpay_payment_id)
      p.merge!({payment_id: p.delete(:razorpay_payment_id) || p[:payment_id]})
      p
    end

    def filter_params
      params.permit(:status, :page)
    end

end