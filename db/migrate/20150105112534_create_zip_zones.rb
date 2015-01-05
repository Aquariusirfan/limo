class CreateZipZones < ActiveRecord::Migration
  def change
    create_table :zip_zones do |t|
      t.references :company_zone
      t.references :zip_code
      t.timestamps
    end
  end
end
