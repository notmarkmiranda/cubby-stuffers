class SessionsController < ApplicationController
  def new
    session[:last_page] = request.referer
  end

  def create
    if params[:commit]
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        session[:last_page] ? redirect_to(session[:last_page]) : redirect_to(login_path)
      else
        flash.now[:error] = "Invalid credentials"
        render :new
      end
    elsif @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid credentials"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged out successfully!"
    redirect_to login_path
  end
end
