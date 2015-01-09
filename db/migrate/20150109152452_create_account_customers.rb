class CreateAccountCustomers < ActiveRecord::Migration
  def change
    create_table :account_customers do |t|
      t.references :account
      t.references :customer
      t.timestamps
    end
  end
end
