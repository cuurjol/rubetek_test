class WaterMeterReading < ApplicationRecord
  belongs_to :user

  validates :hot, numericality: { greater_than: 0 }
  validates :cold, numericality: { greater_than: 0 }

  scope :last_month, -> { where(created_at: Time.now.beginning_of_month - 1.month..(Time.now - 1.month).end_of_month) }
end
