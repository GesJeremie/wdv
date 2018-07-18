class HomeController < BaseController

  def index
    @products = Product.order(unit_price_in_cents: :asc).active
    @products = ProductDecorator.decorate_collection(@products)
  end

end
