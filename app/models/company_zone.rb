class CompanyZone < ActiveRecord::Base
  belongs_to :company
  has_many :zip_codes , dependent: :destroy
end
