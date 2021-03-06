class OrdersController < ApplicationController
    skip_before_action :login_required, only: [:create]

    def create
        # Payment Info
        @payment_info = PaymentInfo.find_by(user_id: current_user.id)

        # Create order (total is still zero)
        @order = Order.create(user_id: current_user.id,
                                    shipping_address: current_user.address,
                                    card_number: @payment_info.card_number,
                                    total: 0,
                                    phone: current_user.phone,
                                    receiver: current_user.name)
        total = 0

        # Carts -> transfer products and quantity information to OrderDetail
        @carts = Cart.where(user_id: current_user.id)

        @carts.each do |cart|
            order_info = OrderDetail.create(user_id: current_user.id,
                                            product_id: cart.product_id,
                                            quantity: cart.quantity,
                                            subtotal: cart.subtotal,
                                            order_id: @order.id)
            total = total + cart.subtotal.to_i

            # Update Stock
            @product = Product.find_by(id: cart.product_id)

            stock = @product.stock - cart.quantity
            @product.update(stock: stock)
        end

        # Update total in Order
        @order.update(total: total)
        
        redirect_to order_path(@order.id), notice: "Order is successfully created"
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
            flash[:notice] = "Shipping information is successfully edited"
            redirect_to order_path(@order)
        else
            flash[:danger] = "Shipping information is failed to edit"
            render :edit
        end
    end

    def complete
        @carts = Cart.where(user_id: current_user.id)
        @carts.each do |cart|
            cart.destroy
        end
        @order = Order.find(params[:id])
        @order_details = OrderDetail.where(order_id: params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:shipping_address, :card_number, :receiver, :phone)
    end
end