class Cubby < ApplicationRecord
  belongs_to :user

  validates :location, presence: true
  validates :column, presence: true
  validates :row, presence: true
  
  def self.get_locations
    pluck(:location)
  end

  def self.get_columns
    pluck(:column)
  end

  def self.get_rows
    pluck(:row)
  end

  def display_location
    location + " " + column + row
  end
end
