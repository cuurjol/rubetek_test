class CreateWaterMeterReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :water_meter_readings do |t|
      t.float :hot, null: false, default: 1
      t.float :cold, null: false, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
