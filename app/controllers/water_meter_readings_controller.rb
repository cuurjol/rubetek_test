class WaterMeterReadingsController < ApplicationController
  before_action :set_water_meter_reading, only: %i[show edit update destroy]

  def index
    @water_meter_readings = policy_scope(WaterMeterReading)
    authorize(@water_meter_readings)
  end

  def new
    @water_meter_reading = WaterMeterReading.new
    authorize(@water_meter_reading)
  end

  def edit
    authorize(@water_meter_reading)
  end

  def create
    @water_meter_reading = current_user.water_meter_readings.build(water_meter_reading_params)

    authorize(@water_meter_reading)

    if @water_meter_reading.save
      redirect_to(water_meter_readings_path, notice: t('controllers.water_meter_readings.created'))
    else
      render(:new)
    end
  end

  def update
    authorize(@water_meter_reading)

    if @water_meter_reading.update(water_meter_reading_params)
      redirect_to(water_meter_readings_path, notice: t('controllers.water_meter_readings.updated'))
    else
      render(:edit)
    end
  end

  def destroy
    authorize(@water_meter_reading)

    @water_meter_reading.destroy
    redirect_to(root_path, notice: t('controllers.water_meter_readings.destroyed'))
  end

  def last_month_report
    @water_meter_readings = WaterMeterReading.includes(:user).last_month
    authorize(@water_meter_readings)
  end

  private

  def set_water_meter_reading
    @water_meter_reading = WaterMeterReading.find(params[:id])
  end

  def water_meter_reading_params
    params.require(:water_meter_reading).permit(:hot, :cold)
  end
end
