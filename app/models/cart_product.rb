class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  attribute :quantity, :integer, default: 0

  def total_price
    (quantity * product.unit_price_in_cents).to_f / 100
  end
end
