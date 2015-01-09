class RateGroup < ActiveRecord::Base
  belongs_to :company
  belongs_to :account
  has_many :location_rules,dependent: :destroy
  has_many :schedules,dependent: :destroy
end
