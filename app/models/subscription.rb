class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :package
  has_many :fulfillments

  validates :user_id, presence: true
  validates :package_id, presence: true
  validates :price, presence: true
  validates :mod, presence: true
  validates :weeks, presence: true

  def week_array
    (1..weeks).to_a
  end

  def self.fulfillment_dropdown_options
    pluck(:mod).uniq.unshift("All Modules")
  end
end
