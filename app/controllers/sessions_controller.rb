class SessionsController < ApplicationController
  def new
    session[:last_page] = request.referer
  end

  def destroy
    session.clear
    flash[:success] = "Logged out successfully!"
    redirect_to login_path
  end
end
