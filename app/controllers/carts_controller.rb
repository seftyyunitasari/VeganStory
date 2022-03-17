class CartsController < ApplicationController
  skip_before_action :login_required, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    cart = current_user.carts.create(product_id: @product.id, quantity: "1", subtotal: @product.price)
    redirect_to products_path, notice: "Product has been added to cart"
  end

  def index
    @carts = current_user.carts
  end

  def destroy
    cart = current_user.carts.find_by(id: params[:id]).destroy
    redirect_to carts_path, notice: "Product has been deleted from cart"
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @subtotal = @cart.product.price * params[:cart][:quantity].to_i
    @cart.update(quantity: params[:cart][:quantity], subtotal: @subtotal)
    redirect_to carts_path, notice: "Cart was successfully edited"
  end

end
