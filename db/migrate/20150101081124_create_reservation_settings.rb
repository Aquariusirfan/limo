class CreateReservationSettings < ActiveRecord::Migration
  def change
    create_table :reservation_settings do |t|
      t.integer :company_id
      t.integer :minimum_lead_time
      t.float :gratuity_rate
      t.boolean :selectable_tip
      t.float :tax_rate
      t.string :distance_type
      t.string :currency
      t.string :rate_to_display
      t.integer :request_min_hours
      t.integer :request_max_hours
      t.boolean :request_summary
      t.boolean :confirmation_summary
      t.text :rate_disclaimer
      t.text :credit_card_disclaimer
      t.string :analytics_code

      t.timestamps
    end
    ReservationSetting.create()
  end
end
