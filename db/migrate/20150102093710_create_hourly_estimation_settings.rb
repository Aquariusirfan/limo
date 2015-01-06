class CreateHourlyEstimationSettings < ActiveRecord::Migration
  def change
    create_table :hourly_estimation_settings do |t|
      t.integer :rate_group_id
      t.string :service
      t.float :up_to_hours
      t.float :hourly_rate
      t.references :company
      t.references :vehicle_type
      t.timestamps
    end
  end
end
