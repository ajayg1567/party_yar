class Order < ActiveRecord::Base
  serialize :additional, Hash
  include OrderConcerns::Razorpay
  belongs_to :product
  belongs_to :user
  belongs_to :product_upgrade, class_name: 'ProductUpgrade', foreign_key: 'product_upgrade_id', optional: true


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
        razorpay_pmnt_obj.capture({amount: ((current_cart.total_amount_with_delivery.to_i) * 100)})
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
  def total_price
    total_price = []
    if self.additional[:product_upgrade_id].present?
        total_price << product_upgrade.price.to_i
    else
      total_price << self.additional[:add_ons].map{|m, count| AddOn.find(m).price.to_i * count.to_i}.flatten.map(&:to_i) if self.additional[:add_ons].present?
      total_price << product.price.to_i * (self.additional[:cake_price_value] || 1)
    end
    total_price.flatten.sum
  end

  def adjusted_price
    self.additional[:product_upgrade_id].present? ? product_upgrade.price.to_i : product.price.to_i * (self.additional[:cake_price_value] || 1)
  end

  def product_upgrade
    ProductUpgrade.find(self.additional[:product_upgrade_id])
  end

  def recipient_address
    Address.find(self.additional[:address_id])
  end
end