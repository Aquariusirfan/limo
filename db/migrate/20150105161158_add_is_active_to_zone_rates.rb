class AddIsActiveToZoneRates < ActiveRecord::Migration
  def change
    add_column :zone_rates, :is_active, :boolean , default: false
  end
end
