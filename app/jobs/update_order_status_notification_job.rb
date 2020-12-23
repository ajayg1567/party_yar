class UpdateOrderStatusNotificationJob < ApplicationJob
  include SuckerPunch::Job

  def perform(order)
  	admin_email = "ashdandek@gmail.com"
  	user = order.user
  	user_email  = user.email
  	OrderMailer.notify(order, user_email).deliver
  	OrderMailer.notify(order, admin_email).deliver
  	message =  "Order # #{order.order_no} has been confirmed
				User name: #{user.name}
				User email: #{user.email}
				Product Name: #{order.product.name}
				Order Price: #{order.price}"
  	TwilioTextMessenger.new(message).send(order.user.phone)
  end
end