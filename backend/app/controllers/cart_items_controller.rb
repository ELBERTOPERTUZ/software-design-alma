class CartItemsController < ApplicationController
  def create
    cart = current_cart
    product = Product.find(params[:product_id])
    selected_sizes = Array(params[:sizes])
  
    if selected_sizes.empty?
      redirect_back fallback_location: root_path, alert: t("size_obligatory")
      return
    end
  
    selected_sizes.each do |size|
      item = cart.cart_items.find_by(product_id: product.id, size: size)
  
      if item
        item.increment(:quantity)
      else
        item = cart.cart_items.build(product: product, size: size, quantity: 1)
      end
  
      item.save
    end
  
    flash[:item_added] = true # 🔥 Aquí
    redirect_back fallback_location: root_path
  end
  

  def destroy
    item = current_cart.cart_items.find(params[:id])
    item.destroy
    flash[:item_added] = true # 🔥 Aquí
    redirect_back fallback_location: root_path
  end

  def show
    @cart = current_cart
    @items = @cart.cart_items.includes(:product)
  end
end
