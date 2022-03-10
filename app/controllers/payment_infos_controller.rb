class PaymentInfosController < ApplicationController
  def new
    @payment_info = PaymentInfo.new
  end

  def create
    @payment_info = PaymentInfo.new(payment_info_params)
    if @payment_info.save
      flash.now[:notice] = "Payment information is successfully saved"
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = "Failed to saved payment information"
      render :new
    end
  end

  def show
    @payment_info = PaymentInfo.find(params[:id])
  end

  def edit
    @payment_info = PaymentInfo.find(params[:id])
  end

  def update
    @payment_info = PaymentInfo.find(params[:id])
    if @payment_info.update(payment_info_params)
      flash.now[:notice] = "Payment information is successfully edited"
      redirect_to payment_info_path(@payment_info.id)
    else
      flash.now[:danger] = "Failed to edit payment information"
      render :edit
    end
  end

  def destroy
    @payment_info = PaymentInfo.find(params[:id])
    if @payment_info.destroy
      flash.now[:notice] = "Payment information is successfully deleted"
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = "Failed to edit payment information"
      redirect_to payment_info(@payment_info.id)
    end
  end

  private
  def payment_info_params
    params.require(:payment_info).permit(:user_id, :card_number, :card_holder, :expiration_date, :cvc)
  end
end
