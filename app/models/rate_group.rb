class RateGroup < ActiveRecord::Base
  belongs_to :company
  has_many :location_rules,dependent: :destroy
end
