class OrderDetailsController < ApplicationController
  def index
    @order_details = OrderDetail.where(user_id: current_user.id)
    @orders = Order.where(user_id: current_user.id)
  end
end
