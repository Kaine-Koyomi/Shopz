module ProductsHelper

  def already_in_cart(product)
    @orders.each do |i|
      if i.product_id === product
        if i.user_id === current_user
          return false
          break
        else
          return true
        end
      end
    end
  end

end
