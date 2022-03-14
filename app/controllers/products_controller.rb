class ProductsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]

    def show
        @product = Product.find(params[:id])
        @favourite = current_user.favourites.find_by(product_id: @product.id)
        @cart = current_user.carts.find_by(product_id: @product.id)
    end

    def index
        @product = Product.all
    end
end
