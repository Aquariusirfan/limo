class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :phone1
      t.string :phone2
      t.boolean :show_driver_price
      t.string :dot_number
      t.string :lcc_mc
      t.string :license_number
      t.string :fax
      t.string :website
      t.string :address
      t.string :time_zone
      t.string :company_domain
      t.references :user
      t.timestamps
    end
  end
end
