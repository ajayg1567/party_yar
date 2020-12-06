class OrderMailer < ApplicationMailer
	default from: 'Partyyar <ashdandek@gmail.com>'

	def confirmation(order)
		@order = order
		@user = @order.user
		@product = @order.product
		mail(to: @user.email, subject: 'Order confirmed')
	end

	def notify(order, email)
		@order = order
		@user = @order.user
		@product = @order.product
		mail(to: email, subject: "Order #{@order.state.humanize}")
	end
end
