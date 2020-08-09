class OrderNotificationJob < ApplicationJob
  include SuckerPunch::Job

  def perform(params, current_cart)
  	current_cart.items.each do |item|
		  Order.create(params.merge(product_id: item.product_id, additional: item.additional))
  	end
  	current_cart.destroy
  	# OrderMailer.confirmation(order).deliver
  end
end