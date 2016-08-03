class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome To Cubby Stuffers!"
      send_redemption_offer
      redirect_to new_user_cubby_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :email, :email_confirmation,
                                   :password, :password_confirmation,
                                   :phone_number)
    end

    def send_redemption_offer
      RedemptionOfferMailer.offer(current_user).deliver_now
      flash[:success] << " See your email for special offer!"
    end
end
