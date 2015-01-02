class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.integer :company_id
      t.string :code
      t.string :name
      t.integer :capacity
      t.text :description
      t.float :base_transfer_distance
      t.float :hourly_minimum
      t.attachment :image

      t.timestamps
    end
  end
end
