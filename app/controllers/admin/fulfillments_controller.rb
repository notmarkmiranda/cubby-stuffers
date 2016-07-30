class Admin::FulfillmentsController < Admin::BaseController

  def index
    @fulfillments = Fulfillment.all
  end

  def update
    fulfillment = Fulfillment.find(params[:id])
    fulfillment.update(fulfilled?: true)
    redirect_to admin_fulfillments_path
  end

end
