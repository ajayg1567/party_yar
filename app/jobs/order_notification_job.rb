class OrderNotificationJob < ApplicationJob
  include SuckerPunch::Job

  def perform(params, current_cart)
  	current_cart.items.each do |item|
  		variation = Variation.find_by(id: item.product_variation_id) if item.product_variation_id.present?
		Order.create(params.merge(product_id: item.product_id, product_variation_id: variation, additional: item.additional))
  	end
  	current_cart.destroy
  	# OrderMailer.confirmation(order).deliver
  end
end