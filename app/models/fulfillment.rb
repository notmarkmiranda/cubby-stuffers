class Fulfillment < ApplicationRecord
  belongs_to :subscription

  validates :subscription, presence: true
  validates :week, uniqueness: {scope: :subscription_id }, presence: true, case_sensitive: false

  def user
    self.subscription.user
  end
end
