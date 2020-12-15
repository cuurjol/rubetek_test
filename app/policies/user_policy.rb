class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes_for_create
    %i[email password last_name first_name middle_name address role]
  end

  def permitted_attributes
    strong_params = %i[last_name first_name middle_name email]
    strong_params << :address if user.dweller? || user.admin?
    strong_params << :role if user.admin?
    strong_params
  end

  def show?
    update?
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    user.present? && (user.admin? || user == record)
  end

  def destroy?
    create?
  end

  def debtors_report?
    user.present? && user.employee?
  end
end
