class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Sikeres bejelentkezés"
      redirect_to root_path
    else
      flash.now[:danger] = "Érvénytelen email/jelszó kombináció"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
end
