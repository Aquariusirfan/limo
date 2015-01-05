class ZipCode < ActiveRecord::Base
  belongs_to :company
  has_many :zip_zones
  has_many :company_zones, through: :zip_zones
  accepts_nested_attributes_for :zip_zones
end
