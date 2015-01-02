class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
