class RateGroup < ActiveRecord::Base
  belongs_to :company
  has_many :location_rules,dependent: :destroy
  has_many :schedules,dependent: :destroy
end
