class ProductsController < BaseController
  def show
    @product = Product.find(params[:id]).decorate
  end
end
