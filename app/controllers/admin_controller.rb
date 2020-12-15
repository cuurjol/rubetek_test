class AdminController < ApplicationController
  before_action :verify_is_admin

  def index
    @users = User.not_admin
    @water_meter_readings = WaterMeterReading.all
  end

  private

  def verify_is_admin
    redirect_to(water_meter_readings_path, alert: t('controllers.admin.verify_is_admin')) unless current_user.admin?
  end
end
