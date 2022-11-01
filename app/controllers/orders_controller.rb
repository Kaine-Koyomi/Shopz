class OrdersController < ApplicationController

 
  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to cart_show_path, notice: "its saber"
    else
      @product = @order.product
      render "cart/show"
    end
  end

  def index
    @orders = Order.all
    create
  end

  def update
    @order = current_user.orders.find(params[:id])

    if @order.update(order_params_update)
      redirect_to cart_show_path, notice: "its saber"
    else
      @product = @order.product
      render "cart/show"
    end
  end

  private

  def order_params
    params.permit(:product_id, :quantity)
  end

  def order_params_update
    params.require(:order).permit(:product_id, :quantity)
  end
end

