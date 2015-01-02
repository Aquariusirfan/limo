class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :company_id
      t.string :name
      t.string :service_type
      t.text :description

      t.timestamps
    end
  end
end
