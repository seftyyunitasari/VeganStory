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

end
