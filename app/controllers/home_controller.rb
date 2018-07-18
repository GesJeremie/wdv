class HomeController < BaseController

  def index
    @products = Product.order(unit_price: :asc).active
    @products = ProductDecorator.decorate_collection(@products)
  end

end
