class ZipZone < ActiveRecord::Base
  belongs_to :zip_code
  belongs_to :company_zone
end
