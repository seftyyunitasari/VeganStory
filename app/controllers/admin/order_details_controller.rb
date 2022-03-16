class Admin::OrderDetailsController < ApplicationController
  def index
    @order_details = OrderDetail.all
    @orders = Order.all
  end
end
