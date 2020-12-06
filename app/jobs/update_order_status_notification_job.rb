class UpdateOrderStatusNotificationJob < ApplicationJob
  include SuckerPunch::Job

  def perform(order)
  	admin_email = "ashdandek@gmail.com"
  	user_email  = order.user.email
  	OrderMailer.notify(order, user_email).deliver
  	OrderMailer.notify(order, admin_email).deliver
  end
end