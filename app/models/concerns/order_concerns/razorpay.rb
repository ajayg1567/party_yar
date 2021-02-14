module OrderConcerns::Razorpay
  extend ActiveSupport::Concern
  included do
    class << self
      def fetch_payment(raz_payment_id)
        Razorpay::Payment.fetch(raz_payment_id)
      end

      def generate_order_id(product, item)
      	seed = Random.rand(10000) % 100
    		receipt = "#{product.id.to_s}#{seed}#{Time.now.strftime('%y%m%d')}"
      	amount = item.product_variation_id.present? ? Variation.find_by(id: item.product_variation_id).price : product.price.to_i

        options = { amount: amount,
      							currency: 'INR',
      							receipt: receipt,
      							payment_capture: '0'
      						}
				order = Razorpay::Order.create(options)
				order_id = order.id
				order_id
      end
    end
  end
end