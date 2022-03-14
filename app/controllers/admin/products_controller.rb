class Admin::ProductsController < ApplicationController
    skip_before_action :login_required, only: [:create, :destroy]
    before_action :check_if_admin
    
    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to admin_product_path(@product.id)
        else
            flash.now[:danger] = "Product is failed to create"
            render :new
        end
    end

    def show
        @product = Product.find(params[:id])
        @favourite = current_user.favourites.find_by(product_id: @product.id)
        @cart = current_user.carts.find_by(product_id: @product.id)
    end

    def index
        @product = Product.all
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash.now[:notice] = "Product is successfully edited"
            redirect_to admin_product_path(@product.id)
        else
            flash.now[:danger] = "Product is failed to edit"
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
            flash.now[:notice] = "Product is successfully deleted"
            redirect_to admin_products_path
        else
            flash.now[:danger] = "Product is failed to delete"
            redirect_to admin_products_path
        end
    end

    private
    def product_params
        params.require(:product).permit(:category_id, :name, :price, :stock, :description, :image, :image_chache)
    end

    def check_if_admin
        redirect_to root_path unless current_user.is_admin?
    end
end