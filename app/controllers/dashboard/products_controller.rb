class Dashboard::ProductsController < Dashboard::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = ProductDecorator.decorate_collection(Product.all)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to new_dashboard_product_url, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to edit_dashboard_product_url(@product), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to dashboard_products_url, notice: 'Product was successfully destroyed.'
  end

  private

    def set_product
      @product = Product.find(params[:id]).decorate
    end

    def product_params
      params.require(:product).permit(:title, :description, :short_description, :unit_price, :in_stock, :gif, :icon, :category_id, :metadata, :active)
    end
end
