class OrdersController < BaseController

  def show
    @cart = current_user.cart.decorate
  end

end
