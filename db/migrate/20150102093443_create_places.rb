class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :company_id
      t.string :name
      t.string :code
      t.string :place_type
      t.string :address
      t.string :city
      t.string :country
      t.string :state_province
      t.string :zip_code

      t.timestamps
    end
  end
end
