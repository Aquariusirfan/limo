class CreateDistanceEstimationSettings < ActiveRecord::Migration
  def change
    create_table :distance_estimation_settings do |t|
      t.integer :rate_group_id
      t.float :up_to_mile
      t.float :base_charge
      t.float :cost_per_distance
      t.float :miles_per_distance
      t.references :company
      t.references :vehicle_type
      t.timestamps
    end
  end
end
