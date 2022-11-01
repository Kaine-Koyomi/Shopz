class CartController < ApplicationController

  def show
    @order = Order.new
    @orders = Order.all
    @cartarray = [] 
    @products = Product.all
  end

  def remove_from_cart
    id = params[:id]
    session[:cart].delete(id)
    Order.where(:product_id => id, :user_id => current_user.id).destroy
    redirect_to cart_show_path
  end


  private
  def load_cart
    @cart = Product.find(session[:cart])
  end

 end
