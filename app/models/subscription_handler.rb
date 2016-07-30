class SubscriptionHandler
  attr_reader :user, :mod, :price, :weeks, :package_id

  def initialize(user, mod, price, weeks, package_id)
    @user = user
    @mod = mod
    @price = price
    @weeks = weeks
    @package_id = package_id
  end

  def create_subscription
    new_sub = user.subscriptions.create(mod: mod,
                                      price: price,
                                      weeks: weeks,
                                      package_id: package_id)
    create_fulfillments(new_sub)
    new_sub
  end

  def create_fulfillments(subscription)
    subscription.week_array.each do |week|
      subscription.fulfillments.create(week: week)
    end
  end
end
