=beginclass ProductFinder
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def execute
    products = Product.active
    products = by(:subscription_available, products)
    products = by(:discount_for_subscription, products)
    products = by(:shaker_free, products)
    products = by(:sample_pack_available, products)
    products = by(:state, products)

    products = by_relation(:diet, :product_diets, :vegetarian, products)
    products = by_relation(:diet, :product_diets, :vegan, products)
    products = by_relation(:diet, :product_diets, :ketogenic, products)

    products = by_relation(:allergen, :product_allergens, :gluten, products)
    products = by_relation(:allergen, :product_allergens, :lactose, products)
    products = by_relation(:allergen, :product_allergens, :nut, products)
    products = by_relation(:allergen, :product_allergens, :ogm, products)
    products = by_relation(:allergen, :product_allergens, :soy, products)
  end

  private

    def by(column, items)
      if params[column].present?
        items = items.where(column => params[column])
      else
        items
      end
    end

    def by_relation(relation, relation_scope, column, items)
      if params[column].present?
        items = items.joins(relation).where(relation_scope => { column => params[column] })
      else
        items
      end
    end
end
=end
