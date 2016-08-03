class Api::V1::RedemptionsController < ApiBaseController

  def create
    Redemption.create(redemption_params)
    flash[:success] = "Congratulations, you are officially an original Cubby Stuffers customer! We look forward to serving you!"
    redirect_to dashboard_path
  end

  private
  def redemption_params
    params.permit(:user_id)
  end
end
