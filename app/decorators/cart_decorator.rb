class CartDecorator < Draper::Decorator
  delegate_all

  def total_price_humanize
    h.price_humanize(total_price)
  end
end
