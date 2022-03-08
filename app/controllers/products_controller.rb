class ProductsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to product_path(@product.id)
        else
            flash.now[:danger] = "Product is failed to create"
            render :new
        end
    end

    def show
        @product = Product.find(params[:id])
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
            redirect_to product_path(@product.id)
        else
            flash.now[:danger] = "Product is failed to edit"
            render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
            flash.now[:notice] = "Product is successfully deleted"
            redirect_to products_path
        else
            flash.now[:danger] = "Product is failed to delete"
            redirect_to products_path
        end
    end

    private
    def product_params
        params.require(:product).permit(:category_id, :name, :price, :stock, :description, :image, :image_chache)
    end
end
