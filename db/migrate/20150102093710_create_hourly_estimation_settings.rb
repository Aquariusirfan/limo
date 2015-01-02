class CreateHourlyEstimationSettings < ActiveRecord::Migration
  def change
    create_table :hourly_estimation_settings do |t|
      t.string :rate_group
      t.string :service
      t.float :up_to_hours
      t.float :hourly_rate
      t.references :company
      t.references :vehicle_type
      t.timestamps
    end
  end
end
