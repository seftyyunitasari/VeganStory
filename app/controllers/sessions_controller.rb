class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:now] = "You are successfully logged in"
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "Email and passoword combinantion is wrong"
      render :new
    end
  end

  def destroy
    respond_to do |format|
      if session.delete(:user_id)
        format.turbo_stream { redirect_to new_session_path, notice: "You are logged out" }
      end
    end
  end

end