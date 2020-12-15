class WaterMeterReadingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
        user.dweller? ? scope.where(user: user) : scope.all
      end
    end
  end

  def index?
    user.present? && (user.dweller? || user.employee?)
  end

  def create?
    user.present? && user.dweller?
  end

  def update?
    user.present? && record.user == user || user.admin?
  end

  def destroy?
    update?
  end

  def last_month_report?
    user.present? && user.employee?
  end
end
