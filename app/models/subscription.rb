class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :package

  validates :user_id, presence: true
  validates :package_id, presence: true
  validates :price, presence: true
  validates :module, presence: true
  validates :weeks, presence: true
end
