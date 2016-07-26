class SessionsController < ApplicationController
  def new
    session[:last_page] = request.referer 
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:last_page] ? redirect_to(session[:last_page]) : redirect_to(login_path)
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
