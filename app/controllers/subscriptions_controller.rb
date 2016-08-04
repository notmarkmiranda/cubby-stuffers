class SubscriptionsController < ApplicationController
  def show
    @subscription = Subscription.find(params[:id])
  end

  def index
    @subscriptions = current_user.subscriptions
  end
end
