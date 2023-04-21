class ProductsController < ApplicationController
  before_action :set_categories

  before_action :authenticate_user!
  
  autocomplete :product, :title, :full => true

  def index
    @categories = Category.all
    @products = Product.all
    @order = params.dig(:product, :order)
    @products = if @order && @order == 'Name: +'
                  @products.title_clasick
                elsif @order && @order == 'Name: -'
                  @products.title_back
                elsif @order && @order == 'Price: High'
                  @products.price_high
                elsif @order && @order == 'Price: Low'
                  @products.price_low
                else
                  @products = Product.all
                end
    @pagy, @records = pagy(@products, items: 10)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path(@product), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def search
    @products = Product.where('title LIKE?', "%" + params[:q] + "%").order('title')
    @pagy, @records = pagy(@products, items: 10)
  end

  def search_by_price
    if params[:min].present?
      min = params[:min]
    else
      min = 0
    end
    if params[:max].present?
      max = params[:max]
    else
      max = 1000000000
    end
    @products = Product.where('price >= ? AND price <= ?', min, max)
    @pagy, @records = pagy(@products, items: 10)
  end

  def search_by_category
    @category = Category.find(params[:id])
    @products = @category.products
  end

  private

  def product_params
    params.require(:product).permit(:title, :content, :image, :price, :category_id)
  end

  def set_categories
    @categories = Category.all
  end

end