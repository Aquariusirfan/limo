class AddZoneRateToZoneRates < ActiveRecord::Migration
  def change
    add_column :zone_rates, :zone_rate, :string
  end
end
