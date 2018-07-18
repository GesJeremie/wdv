class ProductDecorator < Draper::Decorator
  delegate_all

  def unit_price_humanize
    h.price_humanize(unit_price)
  end
end
