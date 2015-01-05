class Reservation < ActiveRecord::Base
  belongs_to :vehicle_type
  belongs_to :company
  belongs_to :service
end
