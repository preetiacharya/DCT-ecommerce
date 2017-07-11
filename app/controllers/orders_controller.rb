class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    #@order.set_order_details
    if @order.save
      redirect_to order_path(@order.id), notice: "Your order has been placed"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    #params[:order].permit()
  end
end
