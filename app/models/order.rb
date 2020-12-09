class Order < ActiveRecord::Base
  serialize :additional, Hash
  include OrderConcerns::Razorpay
  belongs_to :product
  belongs_to :user

  enum state: [ :pending, :confirmed, :dispatched, :delivered, :cancelled]
  [:authorized, :captured, :refunded, :error].each do |scoped_key|
    scope scoped_key, -> { where('LOWER(status) = ?', scoped_key.to_s.downcase) }
  end

  class << self
    def process_razorpayment(params, current_cart)
      product = Product.find(current_cart.items.first.product_id)
      razorpay_pmnt_obj = fetch_payment(params[:payment_id])
      status = fetch_payment(params[:payment_id]).status
      if status == "authorized"
        razorpay_pmnt_obj.capture({amount: ((current_cart.total_amount_with_delivery) * 100)})
        razorpay_pmnt_obj = fetch_payment(params[:payment_id])
        razorpay_pmnt_order_id = generate_order_id(product)
        params.merge!({status: razorpay_pmnt_obj.status, price: current_cart.total_amount_with_delivery, payment_mode: razorpay_pmnt_obj.method, order_id: razorpay_pmnt_order_id, order_no: Random.rand(10000000)})
        OrderNotificationJob.perform_async(params, current_cart)
      else
        raise StandardError, "Unable to capture payment"
      end
    end

    def process_refund(payment_id)
      fetch_payment(payment_id).refund
      record = Order.find_by_payment_id(payment_id)
      record.update_attributes(status: fetch_payment(payment_id).status)
      return record
    end

    def filter(params)
      scope = params[:status] ? Order.send(params[:status]) : Order.authorized
      return scope
    end
  end
end