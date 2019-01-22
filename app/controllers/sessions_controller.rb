class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.valid_password?(params[:session][:password])
      log_in user
      redirect_to purchases_path
    else
      flash.now[:danger] = 'Email o password inválidos'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
