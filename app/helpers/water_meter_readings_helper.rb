module WaterMeterReadingsHelper
  def water_meter_reading_title_form(water_meter_reading)
    water_meter_reading.new_record? ? t('water_meter_readings.new.title') : t('water_meter_readings.edit.title')
  end
end
