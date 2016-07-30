class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def show
    @subscription = Subscription.new
    @package = Package.find(params[:id])
  end
end
