class ChargesController < ApplicationController

  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    new_sub = current_user.subscriptions.create(module: params[:module],
                                                price: 5,
                                                weeks: 6,
                                                package_id: params[:package_id])
    redirect_to subscription_path(new_sub)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
