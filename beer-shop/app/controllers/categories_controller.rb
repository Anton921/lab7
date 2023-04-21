class CategoriesController < ApplicationController
    before_action :set_categories

    def index
        @categories = Categories.all
    end

    def show
        @category = Category.find(params[:id])
        @products = @category.products
        @pagy, @records = pagy(@products, items: 10)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new
    end

    private

    def set_categories
      @categories = Category.all
    end
end