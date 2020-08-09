class OrderMailer < ApplicationMailer
	default from: 'Partyyar <ashdandek@gmail.com>'

	def confirmation(order)
		@order = order
		@user = @order.user
		@product = @order.product
		mail(to: @user.email, subject: 'Order confirmed')
	end
end
