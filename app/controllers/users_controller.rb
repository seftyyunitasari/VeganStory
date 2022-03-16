class UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id), notice: "Account has successfully created"
        else
            flash.now[:danger] = "Account is failed to edit"
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @payment_info = PaymentInfo.find_by(user_id: current_user.id)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id), notice: "Account has successfully edited"
        else
            flash.now[:danger] = "Account is failed to edit"
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone)
    end

end
