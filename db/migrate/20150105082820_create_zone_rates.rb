class CreateZoneRates < ActiveRecord::Migration
  def change
    create_table :zone_rates do |t|
      t.string :zone_rate
      t.boolean :is_active , default: false
      t.integer :source_id
      t.integer :destination_id
      t.references :vehicle_type
      t.references :company
      t.timestamps
    end
  end
end
