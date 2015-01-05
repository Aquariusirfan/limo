class AddCompanyIdToZoneRates < ActiveRecord::Migration
  def change
    add_column :zone_rates, :company_id, :string
  end
end
