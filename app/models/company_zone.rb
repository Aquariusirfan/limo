class CompanyZone < ActiveRecord::Base
  belongs_to :company
  has_many :zip_zones
  has_many :zip_codes, through: :zip_zones
end
