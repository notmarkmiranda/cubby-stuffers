class CubbiesController < ApplicationController
  def new
    @user = current_user
    @cubby = Cubby.new
  end

  def create
    @user = current_user
    @cubby = Cubby.new(user: @user)
    @cubby.update_attributes(cubby_params)

    if @cubby.save
      flash[:success] = "Sucessfully Registered Cubby!"
      redirect_to dashboard_path
    else
      flash[:error] = @cubby.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def cubby_params
    params.require(:cubby).permit(:location, :column, :row)
  end

end
