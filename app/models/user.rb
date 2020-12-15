class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: %i[dweller employee admin]

  has_many :water_meter_readings, dependent: :destroy

  validates :last_name, presence: true, length: { minimum: 4, maximum: 25 }
  validates :first_name, presence: true, length: { minimum: 4, maximum: 25 }
  validates :middle_name, presence: true, length: { minimum: 4, maximum: 25 }
  validates :address, length: { maximum: 100 }
  validates :email, length: { maximum: 100 }, uniqueness: true, format: /\A[^@\s]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i

  scope :not_admin, -> { where.not(role: 'admin') }

  def self.debtors
    last_month = Time.now.beginning_of_month - 1.month..(Time.now - 1.month).end_of_month
    User.includes(:water_meter_readings).where.not(water_meter_readings: { created_at: last_month })
  end

  def full_name
    "#{last_name.capitalize} #{first_name.capitalize} #{middle_name.capitalize}"
  end
end
