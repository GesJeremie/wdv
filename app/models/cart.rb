class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def total_price
    cart_products.sum(&:total_price)
  end

  def count_quantities
    cart_products.sum(:quantity)
  end

  def count_items
    cart_products.count
  end
end
