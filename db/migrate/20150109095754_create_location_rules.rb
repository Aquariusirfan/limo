class CreateLocationRules < ActiveRecord::Migration
  def change
    create_table :location_rules do |t|
      t.string :name
      t.string :location_type
      t.string :condition_type
      t.string :radius_distance
      t.string :address
      t.string :postal_code
      t.string :state
      t.string :country
      t.references :rate_group
      t.timestamps
    end
  end
end
