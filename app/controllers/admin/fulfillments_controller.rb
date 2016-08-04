class Admin::FulfillmentsController < Admin::BaseController

  def index
    @fulfillments = Fulfillment.all
    dropdown_options
  end

  def update
    fulfillment = Fulfillment.find(params[:id])
    fulfillment.update(fulfilled?: true)
    redirect_to admin_fulfillments_path
  end

  private
  def dropdown_options
    @modules = Subscription.fulfillment_dropdown_options
    @weeks = ["All Weeks", "1", "2", "3", "4", "5", "6"]
    @users = User.fulfillment_dropdown_options
    @status = ["All", "Pending", "Complete"]
  end

end
