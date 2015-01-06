class CreateRateGroups < ActiveRecord::Migration
  def change
    create_table :rate_groups do |t|
      t.string :name
      t.references :company
      t.timestamps
    end
  end
end
