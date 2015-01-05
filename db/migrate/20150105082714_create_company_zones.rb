class CreateCompanyZones < ActiveRecord::Migration
  def change
    create_table :company_zones do |t|
      t.string :name
      t.references :company
      t.timestamps
    end
  end
end
