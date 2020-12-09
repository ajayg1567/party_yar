class Admin::OrdersController < ApplicationController
    layout 'admin'

  def index
    @orders = Order.all
  end


  def edit
    @order = Order.find(params[:id])
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to admin_order_path(@order)
    else
      render 'edit'
    end
  end

  def show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
    @order_status = (@order.status== "captured")? "Processing" :@order.status
    @full_address = Address.full_address(@order.additional[:address_id])
  end

  def invoice_show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
    @full_address = Address.full_address(@order.additional[:address_id])

        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Invoice No. #{@order.id}",
                page_size: 'A4',
                template: "admin/orders/invoice_show.html.erb",
                layout: "pdf.html",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
            end
        end
  end

  
  def destroy
    begin
      @order = Order.find(params[:id])
      if @order.destroy
        admin_orders_path
      else
        admin_orders_path 
      end
    rescue Exception => e
      
    end
  end

  def update_status
    order = Order.find(params[:order_id])
    order.update(state: params[:state].to_i)
    UpdateOrderStatusNotificationJob.perform_async(order) unless order.pending?
  end

private
   def order_params
    params.require(:order).permit!
   end

end
