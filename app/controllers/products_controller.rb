class ProductsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create, :index]

    def show
        @product = Product.find(params[:id])
        @favourite = current_user.favourites.find_by(product_id: @product.id)
        @cart = current_user.carts.find_by(product_id: @product.id)
        @comments = Comment.where(product_id: params[:id])
    end

    def index
        @product = Product.all
    end
end
