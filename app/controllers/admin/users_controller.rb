class Admin::UsersController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
    before_action :check_if_admin

    def show
        @user = User.find(params[:id])
        @payment_info = PaymentInfo.find_by(user_id: current_user.id)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if params[:is_admin]
            @user.update_attribute :is_admin, params[:is_admin]
            redirect_to admin_users_path, notice: "Admin authority is successfully edited"
        else
            if @user.update(user_params)
                redirect_to admin_user_path(@user.id), notice: "Account has successfully edited"
            else
                flash.now[:danger] = "Account is failed to edit"
                render :edit
            end
        end
    end

    def index
        @user = User.all
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to users_path, notice: "An account has successfully deleted"
        else
            redirect_to users_path, notice: "An cccount is failed to delete"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :address, :phone, :is_admin)
    end

    def check_if_admin
        redirect_to root_path unless current_user.is_admin?
    end
end
