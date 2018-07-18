class CartProductsController < BaseController

  def create
    byebug
    @cart_product =
      CartProduct.where(
        product_id: Product.find(cart_products_params[:product_id]),
        cart_id: current_user.cart.id
      ).first_or_initialize
    @cart_product.quantity += cart_products_params[:quantity].to_i
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity = cart_products_params[:quantity]
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
  end

  private

    def cart_products_params
      params.require(:cart_products).permit(:product_id, :quantity)
    end
end
