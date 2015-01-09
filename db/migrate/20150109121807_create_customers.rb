class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :company_id

      t.timestamps
    end
  end
  def self.down
    
  end
end
