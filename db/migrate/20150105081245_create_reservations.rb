class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :vehicle_type_id
      t.integer :service_id
      t.integer :company_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_email
      t.string :customer_phone
      t.string :corporate_account
      t.string :passenger_first_name
      t.string :passenger_last_name
      t.string :passenger_email
      t.string :passenger_phone
      t.string :passenger
      t.date :pick_up_date
      t.time :pick_up_time
      t.text :pick_up_location
      t.text :drop_off_location
      t.string :airline
      t.string :flight_number
      t.text :additional_info
      t.string :order_source

      t.timestamps
    end
  end
end
