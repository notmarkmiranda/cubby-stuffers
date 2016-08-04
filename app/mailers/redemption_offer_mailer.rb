class RedemptionOfferMailer < ApplicationMailer
  def offer(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Cubby Stuffers! Special Offer Inside!")
  end
end
