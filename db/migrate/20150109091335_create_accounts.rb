class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.integer :company_id
      t.integer :rate_group_id
      t.integer :rate_adjustment_id

      t.timestamps
    end
  end
  def self.down
    
  end
end
