class ExternalSessionsController < SessionsController

  def create
    if @user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Invalid Github. Do you already have an account with us?"
      redirect_to login_path
    end
  end
end
