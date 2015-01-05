class CreateZoneRates < ActiveRecord::Migration
  def change
    create_table :zone_rates do |t|
      t.integer :source_id
      t.integer :destination_id
      t.references :vehicle_type
      t.timestamps
    end
  end
end
