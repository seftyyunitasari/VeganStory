class OrdersController < ApplicationController
    skip_before_action :login_required, only: [:create]

    def create
        @payment_info = PaymentInfo.find_by(user_id: current_user.id)
        @order = Order.create(user_id: current_user.id, shipping_address: current_user.address, card_number: @payment_info.card_number, total: 0)
        total = 0
        @carts = Cart.where(user_id: current_user.id)
        @carts.each do |cart|
            order_info = OrderDetail.create(user_id: current_user.id, product_id: cart.id, quantity: cart.quantity, subtotal: cart.subtotal, order_id: @order.id)
            total = total + cart.subtotal.to_i
        end
        @order.update(total: total)
        redirect_to order_path(@order.id)
    end

    def show
        @order = Order.find(params[:id])
        @order_details = OrderDetail.where(order_id: params[:id])
        @payment_info = PaymentInfo.find_by(user_id: current_user.id)
    end

    def edit
        @order = Order.find(params[:id])
    end

    def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
            redirect_to order_path(@order)
        else
            render :edit
        end
    end

    def complete
        @carts = Cart.where(user_id: current_user.id)
        @carts.each do |cart|
            cart.destroy
        end
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:shipping_address, :card_number)
    end
end