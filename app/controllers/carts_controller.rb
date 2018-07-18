class CartsController < BaseController

  def show
    @cart = current_user.cart.decorate
  end

  def destroy
    current_user.cart.cart_products.delete_all
  end
end
