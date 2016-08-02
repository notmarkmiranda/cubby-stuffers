class InternalSessionsController < SessionsController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      route_by_role
    else
      flash.now[:danger] = "Invalid credentials"
      render :new
    end
  end

  private
    def route_by_role
      if current_admin?
        redirect_to admin_dashboard_path
      else
        session[:last_page] ? redirect_to(session[:last_page]) : redirect_to(login_path)
      end
    end
end
