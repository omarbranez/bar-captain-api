class ProductsController < ApplicationController
    def index
        products = Product.all
        render json: ProductSerializer.new(products)
    end

    def show
        product = Product.find(params[:id])
        render json: ProductSerializer.new(product)
    end
end
